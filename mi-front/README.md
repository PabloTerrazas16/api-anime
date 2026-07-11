# mi-front

Frontend simple hecho con TypeScript y Bun. Se conecta al backend para obtener datos.

## Stack

- **TypeScript**: Para que el codigo sea mas seguro
- **Bun**: Runtime de JavaScript moderno
- **Axios**: Para hacer requests al backend

## Para empezar en desarrollo

Instala las dependencias:

```bash
bun install
```

Luego levanta el servidor de desarrollo:

```bash
bun run dev
```

El frontend estara disponible en `http://localhost:3001`

> [!NOTE]
> Asegurate de que el backend este corriendo en `http://localhost:3000` para que el frontend pueda conectarse, si no, te toca modificar los puertos para que calzen xd

## Con Docker

Desde la carpeta raiz del proyecto:

```bash
docker compose up
```

Docker levantara el frontend en el puerto 3001.

## Estructura

```
index.ts   - Logica del frontend
index.html - HTML base
```

## Scripts

- `bun run dev` - Levanta el servidor de desarrollo con hot reload