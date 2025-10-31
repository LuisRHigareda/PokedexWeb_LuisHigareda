<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Pokedex — Lista</title>
  <style>
    body{font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;margin:0;background:#0f172a;color:#e2e8f0}
    header,main{max-width:1100px;margin:auto;padding:16px}
    .toolbar{display:flex;justify-content:space-between;align-items:center;gap:12px;margin:10px 0}
    a.btn{padding:.7rem 1rem;border-radius:12px;background:#22c55e;color:#08121f;font-weight:700;text-decoration:none}
    table{width:100%;border-collapse:collapse;background:#0b1220;border:1px solid #1e293b;border-radius:16px;overflow:hidden}
    th,td{padding:12px;border-bottom:1px solid #1e293b;text-align:left}
    th{background:#0f172a}
    img{width:56px;height:56px;object-fit:contain;filter:drop-shadow(0 4px 12px rgba(0,0,0,.45))}
    @media (max-width:720px){
      table,tbody,tr,td,th{display:block}
      tr{border-bottom:1px solid #1e293b}
      td{display:flex;justify-content:space-between;gap:12px}
      td::before{content:attr(data-label);opacity:.7}
    }
  </style>
</head>
<body>
<header><h1>Pokedex</h1></header>
<main>
  <div class="toolbar">
    <p>Total registrados: <strong><c:out value="${applicationScope.pokemons.size()}"/></strong></p>
    <a class="btn" href="${pageContext.request.contextPath}/pokemons/new">Agregar Pokémon</a>
  </div>

  <table>
    <thead>
    <tr>
      <th>#</th><th>Imagen</th><th>Nombre</th><th>Tipo</th><th>Número</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${applicationScope.pokemons}" var="p" varStatus="st">
      <tr>
        <td data-label="#">${st.index + 1}</td>
        <td data-label="Imagen"><img src="${p.imagenUrl}" alt="${p.nombre}"/></td>
        <td data-label="Nombre"><c:out value="${p.nombre}"/></td>
        <td data-label="Tipo"><c:out value="${p.tipo}"/></td>
        <td data-label="Número"><c:out value="${p.numero}"/></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</main>
</body>
</html>
