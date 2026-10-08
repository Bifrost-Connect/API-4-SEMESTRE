<h1 align="center">📌 Sprint 02 - Análise Espacial, Rastreabilidade e Versionamento</h1>

<div align="center">
  <img src="../../../img/banner.png" alt="Banner do Projeto" width="100%">
</div>

<br />

<table width="100%">
  <thead>
    <tr>
      <th align="center"><a href="#backlog2">Backlog da Sprint 2</a></th>
      <th align="center"><a href="#dor">🏃 DoR</a></th>
      <th align="center"><a href="#dod">🏆 DoD</a></th>
      <th align="center"><a href="#artefatos">🧾 Artefatos Correlatos</a></th>
      <th align="center"><a href="#modelodados">🗄️ Modelo de Dados</a></th>
      <th align="center"><a href="#mvp">🎯 MVP</a></th>
    </tr>
  </thead>
</table>

<br>

**Status da Sprint:** 🟡 Em andamento

<table width="100%">
  <tbody>
    <tr>
      <td width="30%"><strong>Capacidade estimada da equipe</strong></td>
      <td>47 Story Points</td>
    </tr>
    <tr>
      <td><strong>Meta da Sprint</strong></td>
      <td>Conclusão da Quarentena (US-04 remanejada), cruzamento analítico, linhagem, imutabilidade, mapa e catálogo de dados (US 4, 5, 6, 7, 8 e 9).</td>
    </tr>
    <tr>
      <td><strong>Período</strong></td>
      <td>Segundo ciclo de desenvolvimento (Sprint 2)</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="backlog2">Backlog da Sprint 2</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="center" width="5%">#</th>
      <th align="center" width="10%">Prioridade</th>
      <th align="left">User Story</th>
      <th align="center" width="8%">SP</th>
      <th align="center" width="8%">Sprint</th>
      <th align="center" width="8%">Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">4</td>
      <td align="center">Alta</td>
      <td>Como <strong>operador de dados</strong>, quero <strong>um filtro que desvie registros inconsistentes para quarentena</strong> para barrar geometrias quebradas ou dados duplicados antes que eles cheguem na base tratada.</td>
      <td align="center">8</td>
      <td align="center">2</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">5</td>
      <td align="center">Alta</td>
      <td>Como <strong>auditor ambiental</strong>, quero <strong>consultar a linhagem de um indicador até o arquivo bruto de origem</strong> para responder auditorias externas comprovando quais versões e regras geraram o cálculo.</td>
      <td align="center">13</td>
      <td align="center">2</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">6</td>
      <td align="center">Alta</td>
      <td>Como <strong>analista territorial</strong>, quero <strong>calcular automaticamente a sobreposição entre imóveis rurais (CAR) e áreas com alertas ambientais</strong> para eliminar a morosidade e as falhas do cálculo manual em laudos de regularidade.</td>
      <td align="center">13</td>
      <td align="center">2</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">7</td>
      <td align="center">Alta</td>
      <td>Como <strong>gestor de dados</strong>, quero <strong>fechar e proteger versões oficiais de indicadores impedindo edições</strong> para assegurar que relatórios e laudos emitidos possam ser reconstituídos fielmente a qualquer momento.</td>
      <td align="center">8</td>
      <td align="center">2</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">8</td>
      <td align="center">Média</td>
      <td>Como <strong>analista territorial</strong>, quero <strong>ver o traçado dos imóveis e alertas sobrepostos em um mapa interativo</strong> para inspecionar anomalias geográficas sem depender de softwares desktop pesados.</td>
      <td align="center">8</td>
      <td align="center">2</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">9</td>
      <td align="center">Média</td>
      <td>Como <strong>analista de dados</strong>, quero <strong>consultar um catálogo com todas as bases disponíveis e sua situação operacional</strong> para identificar rapidamente quais conjuntos de dados estão vigentes e prontos para uso.</td>
      <td align="center">5</td>
      <td align="center">2</td>
      <td align="center">🟡</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="dor">🏃 Definition of Ready</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="35%">Critério</th>
      <th align="left">Descrição</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>User Story definida</strong></td>
      <td>Histórias da Sprint 2 estruturadas com foco em auditoria retrospectiva, análise espacial, visualização cartográfica e catalogação de bases vigentes.</td>
    </tr>
    <tr>
      <td><strong>Critérios de aceite alinhados</strong></td>
      <td>Regras de intersecção geográfica, cálculo de área métrica em hectares (EPSG:4674), congelamento de safras, filtros de camadas no mapa e inventário do catálogo aprovados pelo PO.</td>
    </tr>
    <tr>
      <td><strong>Ausência de bloqueios</strong></td>
      <td>Massa de dados do Paraná (CAR, APP, PRODES, Embargos, UCs) validada e acesso ao Oracle Spatial homologado para rotinas geodésicas.</td>
    </tr>
    <tr>
      <td><strong>Compreensão do time</strong></td>
      <td>Equipe alinhada sobre a lógica dos scripts analíticos em PL/SQL, rotas de consulta ao catálogo e integração do componente Leaflet no Vue.js.</td>
    </tr>
    <tr>
      <td><strong>Estimativa consolidada</strong></td>
      <td>Histórias pontuadas em Story Points pela escala de Fibonacci durante a dinâmica de planejamento.</td>
    </tr>
    <tr>
      <td><strong>Apoio visual e protótipos</strong></td>
      <td>Wireframes das telas de linhagem de dados, mapa interativo, catálogo geral com situação operacional e painel de congelamento de safras disponíveis.</td>
    </tr>
    <tr>
      <td><strong>Plano de testes montado</strong></td>
      <td>Casos de teste previstos para acurácia de cálculo espacial, filtros de busca de datasets, travas de imutabilidade no banco e renderização GeoJSON.</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="artefatos">🧾 Artefatos Correlatos</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="35%">Recurso</th>
      <th align="left">Descrição</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="../../wireframe%20das%20telas/Telas">🖼️ <strong>Protótipos e Telas</strong></a></td>
      <td>Mockups e telas desenhadas para mapa interativo Leaflet, árvore de linhagem do dado, catálogo de bases e gestão de versões de safras.</td>
    </tr>
    <tr>
      <td><a href="../../bds/Modelagem%20do%20Banco%20de%20Dados.png">🗄️ <strong>Modelagem do Banco de Dados</strong></a></td>
      <td>Diagrama relacional com entidades de ocorrência de validação, processamento espacial, indicadores, catálogo e auditoria.</td>
    </tr>
    <tr>
      <td><a href="Protótipo%20de%20Aplicações.md">🧪 <strong>Roteiro de Testes e Validação</strong></a></td>
      <td>Cenários de validação métrica de intersecções no Oracle Spatial contra o QGIS, listagem paginada do catálogo e integridade de travamento de versões.</td>
    </tr>
    <tr>
      <td><a href="../../bds/visiona_db.sql">📂 <strong>Scripts DDL / PL-SQL</strong></a></td>
      <td>Scripts SQL com índices espaciais, procedures de cálculo analítico e triggers de bloqueio contra UPDATE/DELETE.</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="dod">🏆 Definition of Done (DoD)</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="left" width="35%">Critério</th>
      <th align="left">Descrição</th>
      <th align="center" width="10%">Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Linhagem de dados homologada</strong></td>
      <td>Árvore de linhagem permitindo rastrear o indicador até o arquivo bruto original de entrada.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Rotinas espaciais validadas</strong></td>
      <td>Procedures em PL/SQL executando cruzamentos de CAR contra Alertas e APPs com cálculo de sobreposição em hectares.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Imutabilidade de versões</strong></td>
      <td>Mecanismo de congelamento de safras implementado no banco impedindo alterações posteriores em versões oficiais.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Visualização em mapa interativo</strong></td>
      <td>Camadas cartográficas renderizadas via Leaflet com alternância de layers e popups informativos.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Catálogo operacional ativo</strong></td>
      <td>Interface e endpoint disponibilizando a listagem consolidada de todas as bases e suas respectivas situações.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Testes de precisão analítica</strong></td>
      <td>Métricas calculadas validadas contra ferramentas SIG de referência para assegurar consistência geométrica.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Controle de versão e PR</strong></td>
      <td>Branches de cruzamento espacial, visualização e catálogo revisadas e integradas na develop via Pull Request.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Demonstração realizada</strong></td>
      <td>Incremento funcional do mapa, catálogo e rotinas espaciais demonstrado em funcionamento durante a Sprint Review.</td>
      <td align="center">🟡</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="modelodados">🗄️ Modelo de Dados</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="center">Diagrama Entidade-Relacionamento (Sprint 2)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">
        <img>
      </td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="mvp">🎯 MVP</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="left">Demonstração da Entrega</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>O vídeo demonstrando as funcionalidades da Sprint 2 em execução será incluído aqui após o término das entregas e validação com o cliente.</td>
    </tr>
  </tbody>
</table>