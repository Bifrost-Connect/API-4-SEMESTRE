<h1 align="center">📌 Sprint 03 - Inteligência, Portabilidade e Governança</h1>

<div align="center">
  <img src="../../../img/banner.png" alt="Banner do Projeto" width="100%">
</div>

<br />

<table width="100%">
  <thead>
    <tr>
      <th align="center"><a href="#backlog3">Backlog da Sprint 3</a></th>
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
      <td>26 Story Points</td>
    </tr>
    <tr>
      <td><strong>Meta da Sprint</strong></td>
      <td>Finalizar a entrega do sistema com foco em consumo externo, análise temporal e governança: catálogo geral de dados, comparação histórica entre safras (Chart.js), exportação estruturada (CSV/GeoJSON), gestão de API Keys e controle de acesso RBAC com perfis definidos (US 9, 10, 11, 12 e 13).</td>
    </tr>
    <tr>
      <td><strong>Período</strong></td>
      <td>Terceiro ciclo de desenvolvimento (Sprint 3)</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="backlog3">Backlog da Sprint 3</h2>

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
      <td align="center">10</td>
      <td align="center">Média</td>
      <td>Como <strong>analista territorial</strong>, quero <strong>comparar duas safras de dados de uma mesma região lado a lado</strong> para acompanhar a evolução temporal de irregularidades ambientais e concessão de crédito verde.</td>
      <td align="center">8</td>
      <td align="center">3</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">11</td>
      <td align="center">Média</td>
      <td>Como <strong>gestor ambiental</strong>, quero <strong>baixar os resultados em planilhas (CSV) ou arquivos de mapa (GeoJSON)</strong> para compartilhar dados consolidados com auditorias externas e plataformas de BI parceiras.</td>
      <td align="center">5</td>
      <td align="center">3</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">12</td>
      <td align="center">Baixa</td>
      <td>Como <strong>analista ou integrador externo</strong>, quero <strong>gerar chaves de acesso com opção de cancelamento imediato</strong> para integrar aplicações de forma segura sem expor senhas individuais.</td>
      <td align="center">5</td>
      <td align="center">3</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">13</td>
      <td align="center">Baixa</td>
      <td>Como <strong>administrador</strong>, quero <strong>definir os cargos e limites de acesso de cada membro da equipe</strong> para assegurar segregação de funções e evitar ações indevidas sobre o acervo.</td>
      <td align="center">3</td>
      <td align="center">3</td>
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
      <th align="center" width="10%">Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>User Story definida</strong></td>
      <td>Histórias da Sprint 3 formatadas e focadas em catálogo unificado, comparação temporal, exportação analítica e controle de acesso (RBAC e API Keys).</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Critérios de aceite alinhados</strong></td>
      <td>Esquemas de exportação CSV (delimitador <code>;</code> e UTF-8), padrão GeoJSON (WGS 84 / SRID: 4326), regras de cálculo de variação entre safras e matriz de 5 perfis alinhados com o PO.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Ausência de bloqueios</strong></td>
      <td>Bases de safras anteriores e homologadas disponíveis no banco Oracle para viabilizar cálculos comparativos e extração de dados.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Compreensão do time</strong></td>
      <td>Equipe alinhada sobre integração com Vue Chart.js, interceptors do Spring Security para chaves <code>X-API-KEY</code> e streaming de arquivos pesados.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Estimativa consolidada</strong></td>
      <td>Histórias pontuadas em Story Points na escala Fibonacci, somando a capacidade prevista de 26 SP para o ciclo.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Apoio visual e protótipos</strong></td>
      <td>Wireframes da tela de Catálogo Geral, Comparação de Safras com gráficos, modais de Exportação e Painel Administrativo de Usuários e Chaves prontos.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Plano de testes montado</strong></td>
      <td>Cenários desenhados para validação de integridade nos arquivos exportados, precisão nas fórmulas de delta temporal e testes de segurança nas rotas autenticadas.</td>
      <td align="center">🟡</td>
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
      <td>Mockups e telas desenhadas para catálogo com filtros, painel com gráficos Chart.js, telas de exportação e gestão de credenciais.</td>
    </tr>
    <tr>
      <td><a href="Diagrama Banco de Dados.jpeg">🗄️ <strong>Modelagem do Banco de Dados</strong></a></td>
      <td>Diagrama relacional contendo as estruturas de catálogo, histórico de exportações, chaves de API e controle de usuários e perfis (RBAC).</td>
    </tr>
    <tr>
      <td><a href="Protótipo%20de%20Aplicações.md">🧪 <strong>Roteiro de Testes e Validação</strong></a></td>
      <td>Cenários de teste para validação de downloads de CSV/GeoJSON em SIG, conferência de deltas de safras e checagem de autorizações de rota.</td>
    </tr>
    <tr>
      <td><a href="../../bds/visiona_db.sql">📂 <strong>Scripts DDL / PL-SQL</strong></a></td>
      <td>Scripts SQL com tabelas de usuários, perfis, controle de API Keys e consultas consolidadas para catálogo e comparativo de safras.</td>
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
      <td><strong>Catálogo operacional ativo</strong></td>
      <td>Interface e endpoint disponibilizando a listagem consolidada de todas as bases e suas respectivas situações operacionais.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Comparativo temporal funcional</strong></td>
      <td>Módulo de comparação gráfica entre safras operando na tela via Vue Chart.js calculando variações de área com precisão.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Exportação estruturada homologada</strong></td>
      <td>Geração e download de relatórios em CSV e GeoJSON operando com integridade a partir da Zona Publicada.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Autenticação por API Key</strong></td>
      <td>Módulo de chaves de integração operando com exibição única de token e funcionalidade de cancelamento imediato.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Segregação por RBAC</strong></td>
      <td>Controle de acesso por papéis (Operador, Analista, Auditor, Gestor e Administrador) validado em rotas de backend e telas.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Controle de versão e PR</strong></td>
      <td>Branches de catálogo, gráficos, exportação e autenticação revisadas e integradas na develop via Pull Request.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Demonstração final realizada</strong></td>
      <td>Apresentação do GeoRural DataHub completo operando de ponta a ponta com entrega do vídeo de MVP na Sprint Review.</td>
      <td align="center">🟡</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="modelodados">🗄️ Modelo de Dados</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="center">Diagrama Entidade-Relacionamento (Sprint 3)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">
        <img src="Diagrama Banco de Dados.jpeg" alt="Modelo de Dados GeoRural DataHub - Sprint 3" width="100%">
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
      <td>O vídeo demonstrativo com as funcionalidades da Sprint 3 em execução será incluído aqui após o término das entregas e validação com o cliente Visiona.</td>
    </tr>
  </tbody>
</table>