<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>  
        <title>Nuevo Pokémon — Pokedex</title>
        <link rel="icon" href="images/pb.png" type="image/png" />
        <style>
            body{
                font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;
                margin:0;
                background:#0f172a;
                color:#e2e8f0
            }
            header,main{
                max-width:960px;
                margin:auto;
                padding:16px
            }
            .card{
                background:#0b1220;
                border:1px solid #1e293b;
                border-radius:16px;
                padding:24px;
                box-shadow:0 8px 24px rgba(0,0,0,.3)
            }
            label{
                display:block;
                margin:.5rem 0 .25rem
            }
            input,select{
                width:100%;
                padding:.7rem;
                border-radius:12px;
                border:1px solid #334155;
                background:#0f172a;
                color:#e2e8f0
            }
            .row{
                display:grid;
                grid-template-columns:1fr 1fr;
                gap:12px
            }
            .actions{
                display:flex;
                gap:12px;
                margin-top:16px
            }
            button,a.btn{
                padding:.75rem 1rem;
                border-radius:12px;
                border:none;
                cursor:pointer;
                text-decoration:none;
                display:inline-block
            }
            button{
                background:#22c55e;
                color:#08121f;
                font-weight:600
            }
            a.btn{
                background:#334155;
                color:#e2e8f0
            }
            small{
                display:block;
                opacity:.8;
                margin-top:4px
            }
        </style>
    </head>
    <body>
        <header style="display:flex;justify-content:center;align-items:center;padding:8px 0;">
            <a href="${pageContext.request.contextPath}/pokemons" style="display:inline-block">
                <img
                    src="https://archives.bulbagarden.net/media/upload/4/4b/Pok%C3%A9dex_logo.png"
                    alt="Pokédex"
                    style="height:96px;max-width:100%;object-fit:contain"
                    onerror="this.onerror=null;this.src='https://bulbapedia.bulbagarden.net/wiki/Special:FilePath/Pok%C3%A9dex_logo.png';"
                    />
            </a>
        </header>


        <main>
            <div class="card">
                <form method="post" action="${pageContext.request.contextPath}/pokemons/add">
                    <label for="nombre">Nombre</label>
                    <input id="nombre" name="nombre" required/>

                    <div class="row">
                        <div>
                            <label for="numero">Número</label>
                            <input id="numero" name="numero" type="number" min="1" required/>
                        </div>
                        <div>
                            <label for="tipo">Tipo</label>
                            <input id="tipo" name="tipo" list="tipos" required placeholder="Ej. Fuego/Volador"/>
                            <datalist id="tipos">
                                <!-- Tipos base -->
                                <option value="Normal"/><option value="Fuego"/><option value="Agua"/>
                                <option value="Planta"/><option value="Eléctrico"/><option value="Hielo"/>
                                <option value="Lucha"/><option value="Veneno"/><option value="Tierra"/>
                                <option value="Volador"/><option value="Psíquico"/><option value="Bicho"/>
                                <option value="Roca"/><option value="Fantasma"/><option value="Dragón"/>
                                <option value="Siniestro"/><option value="Acero"/><option value="Hada"/>
                                <!-- Combinaciones comunes -->
                                <option value="Fuego/Volador"/><option value="Agua/Tierra"/><option value="Agua/Volador"/>
                                <option value="Planta/Veneno"/><option value="Bicho/Acero"/><option value="Roca/Tierra"/>
                                <option value="Dragón/Volador"/><option value="Psíquico/Hada"/><option value="Siniestro/Hielo"/>
                                <option value="Tierra/Acero"/><option value="Fantasma/Veneno"/><option value="Lucha/Roca"/>
                                <option value="Eléctrico/Volador"/><option value="Hielo/Agua"/><option value="Hada/Acero"/>
                            </datalist>
                        </div>
                    </div>

                    <label for="imagenUrl">URL de imagen (opcional)</label>
                    <input id="imagenUrl" name="imagenUrl" type="url" placeholder="Déjalo vacío para usar sprite oficial por número"/>
                    <small>Si lo dejas vacío, se usará: https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{numero}.png</small>

                    <div class="actions">
                        <button type="submit">Guardar</button>
                        <a class="btn" href="${pageContext.request.contextPath}/pokemons">Ver lista</a>
                    </div>

                    <c:if test="${not empty requestScope.error}">
                        <p style="color:#fda4af;margin-top:12px">${requestScope.error}</p>
                    </c:if>
                </form>
            </div>
        </main>
    </body>
</html>
