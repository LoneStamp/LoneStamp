function generateHTML(): string {
  return `
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="initial-scale=1, width=device-width" />
      <title>My TypeScript Project</title>
    </head>
    <body>
      <h1>Hello TypeScript Project!</h1>
      <p>This is a TypeScript-generated HTML file.</p>
    </body>
  </html>
  `;
}

console.log(generateHTML());
