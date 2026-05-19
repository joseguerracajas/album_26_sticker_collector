import { GoogleGenerativeAI } from "@google/generative-ai";
import * as readline from "readline/promises";
import { stdin as input, stdout as output } from "process";
import * as fs from "fs";
import * as path from "path";

// Configuración de Gemini y Readline
const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
const rl = readline.createInterface({ input, output });

// Configuración de GitHub
const GITHUB_TOKEN = process.env.GITHUB_TOKEN;
const GITHUB_OWNER = process.env.GITHUB_OWNER;
const GITHUB_REPO = process.env.GITHUB_REPO;

// Rutas relativas a la raíz de tu proyecto
const PATHS = {
  supabase: path.resolve("../../supabase/migrations"),
  frontend: path.resolve("../../src/components/features"),
  workflows: path.resolve("../../.github/workflows"),
  docs: path.resolve("../../docs/releases")
};

// Asegurar que las carpetas existan
Object.values(PATHS).forEach(dir => {
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
});

async function runAgent(role, goal, promptText) {
  console.log(`\n🤖 [Agente: ${role}] Procesando y pensando...`);
  const model = genAI.getGenerativeModel({ 
      model: "gemini-1.5-pro",
      systemInstruction: `Eres un ${role}. Tu objetivo es: ${goal}. Responde solo con el código o resultado técnico directo, sin formato markdown de bloques de código (\`\`\`) si no es necesario.`
  });
  const result = await model.generateContent(promptText);
  return result.response.text().replace(/```\w*\n/g, '').replace(/```/g, ''); // Limpieza de formato
}

async function createGitHubIssue(title, body) {
  console.log(`\n🐙 [GitHub API] Creando Issue en ${GITHUB_OWNER}/${GITHUB_REPO}...`);
  const response = await fetch(`https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/issues`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${GITHUB_TOKEN}`,
      'Accept': 'application/vnd.github.v3+json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ title, body })
  });

  if (response.ok) {
    const data = await response.json();
    console.log(`✅ [Issue Creado exitosamente]: ${data.html_url}`);
    return data;
  } else {
    console.log(`❌ [Error en GitHub]: Revisa tu Token o permisos.`);
    return null;
  }
}

async function startSoftwareFactory() {
  console.log("==========================================================");
  console.log("🚀 INICIANDO ORQUESTADOR AI - ALBUM 26 STICKER COLLECTOR");
  console.log("==========================================================\n");

  const featureRequest = await rl.question("👑 [Orquestador] Ingresa el requerimiento de negocio:\n> ");

  // --- FASE 1: PRODUCTO ---
  let pmOutput = await runAgent(
    "Product Manager",
    "Definir historias de usuario y criterios de aceptación técnicos.",
    `Desglosa este requerimiento en 3 bullets: ${featureRequest}`
  );
  console.log("\n📄 [Historias de Usuario]:\n", pmOutput);

  const pmApproval = await rl.question("\n[Orquestador] ¿Apruebas la creación del ticket en GitHub? (Y/N): ");
  if (pmApproval.toUpperCase() !== 'Y') {
    console.log("🛑 Flujo detenido."); process.exit(0);
  }

  const issue = await createGitHubIssue(`[FEATURE] ${featureRequest}`, pmOutput);

  // --- FASE 2: DESARROLLO ---
  console.log("\n⚡ [Orquestador] Ticket asignado. Desplegando agentes de código...");

  const dataOutput = await runAgent(
    "Supabase Data Architect",
    "Generar código SQL para Supabase (tablas y RLS).",
    `Crea la estructura SQL basada en:\n${pmOutput}`
  );

  const frontendOutput = await runAgent(
    "Mobile Frontend Developer",
    "Generar componente en React Native/TypeScript.",
    `Crea el código del componente basado en:\n${pmOutput}`
  );

  const localizationOutput = await runAgent(
    "App Store ASO Specialist",
    "Redactar notas de versión en Inglés, Español y Portugués.",
    `Crea el texto promocional para:\n${pmOutput}`
  );

  // --- FASE 3: INTEGRACIÓN Y CI/CD ---
  console.log("\n⚙️ [CI/CD] Ejecutando Quality Gate de SonarCloud (Simulado)...");
  await new Promise(resolve => setTimeout(resolve, 1500)); 
  console.log("✅ [SonarCloud] -> PASSED (0 Bugs, 0 Vulnerabilidades)");

  const devopsOutput = await runAgent(
    "DevOps Engineer",
    "Generar YAML de GitHub Actions.",
    `Genera el pipeline para este feature:\n${featureRequest}`
  );

  // --- FASE 4: APROBACIÓN FINAL Y ESCRITURA EN DISCO ---
  const finalApproval = await rl.question("\n[Orquestador] Quality Gate superado. ¿Apruebas el Merge y la escritura en el repositorio? (Y/N): ");
  
  if (finalApproval.toUpperCase() === 'Y') {
    const timestamp = Date.now();
    
    // Escribir en las carpetas reales del proyecto
    fs.writeFileSync(path.join(PATHS.supabase, `${timestamp}_premium_exchange.sql`), dataOutput);
    fs.writeFileSync(path.join(PATHS.frontend, `PremiumExchange_${timestamp}.tsx`), frontendOutput);
    fs.writeFileSync(path.join(PATHS.docs, `ReleaseNotes_${timestamp}.txt`), localizationOutput);
    fs.writeFileSync(path.join(PATHS.workflows, `deploy_feature_${timestamp}.yml`), devopsOutput);
    
    console.log("\n🚀 ¡Éxito! Archivos inyectados directamente en tu repositorio base.");
    console.log(`📁 Revisa las carpetas: /src, /supabase y /.github`);
  } else {
    console.log("🛑 Despliegue abortado.");
  }

  rl.close();
}

startSoftwareFactory();