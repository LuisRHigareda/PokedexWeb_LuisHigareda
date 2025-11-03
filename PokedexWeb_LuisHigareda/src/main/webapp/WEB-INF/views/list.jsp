<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Pokedex — Lista</title>
        <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/favicon.png"/>
        <style>
            body{
                font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;
                margin:0;
                background:#0f172a;
                color:#e2e8f0
            }
            header,main{
                max-width:1100px;
                margin:auto;
                padding:16px
            }
            .toolbar{
                display:flex;
                flex-wrap:wrap;
                justify-content:space-between;
                align-items:center;
                gap:12px;
                margin:10px 0
            }
            a.btn, button.btn{
                padding:.7rem 1rem;
                border-radius:12px;
                border:none;
                cursor:pointer;
                text-decoration:none;
                display:inline-block
            }
            a.btn{
                background:#22c55e;
                color:#08121f;
                font-weight:700
            }
            button.btn{
                background:#334155;
                color:#e2e8f0
            }
            table{
                width:100%;
                border-collapse:collapse;
                background:#0b1220;
                border:1px solid #1e293b;
                border-radius:16px;
                overflow:hidden
            }
            th,td{
                padding:12px;
                border-bottom:1px solid #1e293b;
                text-align:left;
                vertical-align:middle
            }
            th{
                background:#0f172a
            }
            .sprite{
                width:56px;
                height:56px;
                object-fit:contain;
                filter:drop-shadow(0 4px 12px rgba(0,0,0,.45))
            }
            .actions{
                display:flex;
                gap:8px;
                flex-wrap:wrap
            }
            .btn-secondary{
                background:#64748b;
                color:#0b1220;
                font-weight:700;
                text-decoration:none;
                padding:.5rem .75rem;
                border-radius:10px
            }
            .btn-danger{
                background:#ef4444;
                color:#0b1220;
                font-weight:700;
                border:none;
                border-radius:10px;
                padding:.5rem .75rem;
                cursor:pointer
            }
            @media (max-width:860px){
                table,tbody,tr,td,th{
                    display:block
                }
                tr{
                    border-bottom:1px solid #1e293b
                }
                td{
                    display:flex;
                    justify-content:space-between;
                    gap:12px
                }
                td::before{
                    content:attr(data-label);
                    opacity:.7
                }
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
            <div class="toolbar">
                <p>Total registrados: <strong><c:out value="${applicationScope.pokemons.size()}"/></strong></p>

                <div style="display:flex;gap:8px;flex-wrap:wrap">
                    <form method="post" action="${pageContext.request.contextPath}/pokemons/sort">
                        <button class="btn" type="submit" title="Ordenar por número ascendente">Ordenar por número</button>
                    </form>
                    <a class="btn" href="${pageContext.request.contextPath}/pokemons/new">Agregar Pokémon</a>
                </div>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>#</th><th>Imagen</th><th>Nombre</th><th>Tipo</th><th>Número</th><th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${applicationScope.pokemons}" var="p" varStatus="st">
                        <tr>
                            <td data-label="#">${st.index + 1}</td>
                            <td data-label="Imagen"><img class="sprite" src="${p.imagenUrl}" alt="${p.nombre}"/></td>
                            <td data-label="Nombre"><c:out value="${p.nombre}"/></td>
                            <td data-label="Tipo"><c:out value="${p.tipo}"/></td>
                            <td data-label="Número"><c:out value="${p.numero}"/></td>
                            <td data-label="Acciones">
                                <div class="actions">
                                    <a class="btn-secondary" href="${pageContext.request.contextPath}/pokemons/edit?numero=${p.numero}">Editar</a>
                                    <form method="post" action="${pageContext.request.contextPath}/pokemons/delete" onsubmit="return confirm('¿Eliminar a ${p.nombre}?');">
                                        <input type="hidden" name="numero" value="${p.numero}"/>
                                        <button class="btn-danger" type="submit">Eliminar</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </body>
</html>
