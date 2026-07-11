# mi-api

Backend hecho con ElysiaJS y Bun. Es basicamente un API REST simple para jugar.

## Stack

- **ElysiaJS**: Framework web ultra ligero
- **Bun**: Runtime de JavaScript moderno
- **TypeScript**: Para escribir codigo menos propenso a errores

## Para empezar en desarrollo

Primero instala las dependencias:

```bash
bun install
```

Luego corre en modo desarrollo:

```bash
bun run dev
```

El API estara disponible en `http://localhost:3000`

## Con Docker

Simplemente ejecuta desde la carpeta raiz del proyecto:

```bash
docker compose up
```

Docker compilara la imagen automaticamente y levantara el API en el puerto 3000.

## Estructura

```
src/
  index.ts    - El punto de entrada del API
```

## Scripts

- `bun run dev` - Levanta el servidor en modo desarrollo con hot reload
- `bun run build` - Compila el proyecto (si es necesario)