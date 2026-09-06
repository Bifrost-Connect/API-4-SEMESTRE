<h1 align="center">📌 Sprint 01 - Ingestão, Quarentena e Orquestração do Fluxo</h1>

<div align="center">
  <img src="../../../img/banner.png" alt="Banner do Projeto" width="100%">
</div>

<br />

<table width="100%">
  <thead>
    <tr>
      <th align="center"><a href="#backlog1">Backlog da Sprint 1</a></th>
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
      <td>29 Story Points</td>
    </tr>
    <tr>
      <td><strong>Meta da Sprint</strong></td>
      <td>Construir o pipeline inicial de entrada: cadastro de datasets territoriais, upload seguro na Zona Bruta com hash SHA-256, checagem de erros com desvio para Quarentena e acompanhamento das etapas pelo Apache Airflow.</td>
    </tr>
    <tr>
      <td><strong>Período</strong></td>
      <td>Primeiro ciclo de desenvolvimento (Sprint 1)</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="backlog1">Backlog da Sprint 1</h2>

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
      <td align="center">1</td>
      <td align="center">Alta</td>
      <td>Como <strong>operador de dados</strong>, quero <strong>cadastrar os dados de origem de uma base (órgão emissor, ano e sistema de coordenadas)</strong> para organizar a procedência dos arquivos e saber exatamente qual safra está entrando no sistema.</td>
      <td align="center">5</td>
      <td align="center">1</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td>2</td>
      <td align="center">Alta</td>
      <td>Como <strong>operador de dados</strong>, quero <strong>fazer upload salvando uma cópia original com hash SHA-256 na Zona Bruta</strong> para garantir que o arquivo enviado não foi alterado ou corrompido durante a ingestão.</td>
      <td align="center">8</td>
      <td align="center">1</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td align="center">Alta</td>
      <td>Como <strong>operador de dados</strong>, quero <strong>um filtro que desvie registros inconsistentes para quarentena</strong> para barrar geometrias quebradas ou dados duplicados antes que eles cheguem na base tratada.</td>
      <td align="center">8</td>
      <td align="center">1</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td align="center">Alta</td>
      <td>Como <strong>operador de dados</strong>, quero <strong>ver o andamento das etapas da carga na tela</strong> para saber rapidamente em qual passo o processamento está e onde deu erro se a execução falhar.</td>
      <td align="center">8</td>
      <td align="center">1</td>
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
      <td>História descrita com foco na necessidade do negócio e no valor da entrega para o usuário.</td>
    </tr>
    <tr>
      <td><strong>Critérios de aceite alinhados</strong></td>
      <td>Regras de metadados obrigatórios, obrigatoriedade do hash SHA-256 e critérios de descarte para a quarentena aprovados pelo PO.</td>
    </tr>
    <tr>
      <td><strong>Ausência de bloqueios</strong></td>
      <td>Sem pendências técnicas de infraestrutura local, credenciais de banco de dados ou acesso a repositórios.</td>
    </tr>
    <tr>
      <td><strong>Compreensão do time</strong></td>
      <td>Equipe de desenvolvimento alinhada sobre a lógica das etapas e a divisão das tarefas técnicas.</td>
    </tr>
    <tr>
      <td><strong>Estimativa consolidada</strong></td>
      <td>Histórias pontuadas em Story Points pela escala de Fibonacci durante a dinâmica de planejamento.</td>
    </tr>
    <tr>
      <td><strong>Apoio visual e protótipos</strong></td>
      <td>Wireframes das telas de datasets, upload de arquivos, tabela de quarentena e painel de status disponíveis.</td>
    </tr>
    <tr>
      <td><strong>Plano de testes montado</strong></td>
      <td>Casos de teste previstos para validação de integridade criptográfica, esquemas e segregação de registros defeituosos.</td>
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
      <td><a href="../../../Prot%C3%B3tipo%20da%20Aplica%C3%A7%C3%A3o">🖼️ <strong>Protótipos e Telas</strong></a></td>
      <td>Mockups e telas desenhadas para cadastro de fontes, upload com status da carga e visualização dos dados em quarentena.</td>
    </tr>
    <tr>
      <td><a href="../../bds/Modelagem%20Banco%20de%20Dados.png">🗄️ <strong>Modelagem do Banco de Dados</strong></a></td>
      <td>Diagrama relacional contemplando fontes, datasets, logs de ingestão, hash e registros segregados no Oracle.</td>
    </tr>
    <tr>
      <td><a href="relatorio_avaliacoes.md">🧪 <strong>Roteiro de Testes e Validação</strong></a></td>
      <td>Cenários de testes unitários para verificação do cálculo de SHA-256, constraints de banco e disparos das DAGs no Airflow.</td>
    </tr>
    <tr>
      <td><a href="../../bds/georural_schema.sql">📂 <strong>Scripts DDL</strong></a></td>
      <td>Scripts SQL de criação do esquema do banco de dados para as zonas Bruta e Quarentena.</td>
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
      <td><strong>Código pronto e funcional</strong></td>
      <td>A funcionalidade foi codificada de ponta a ponta e atende aos critérios de aceitação combinados.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Padrão de commits no Git</strong></td>
      <td>Commits organizados no repositório seguindo mensagens semânticas convencionais.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Isolamento em branches</strong></td>
      <td>Cada história desenvolvida em sua branch de funcionalidade específica.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Revisão por Pull Request</strong></td>
      <td>Código revisado e validado por outro desenvolvedor do time antes do merge na branch de desenvolvimento.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Integridade do arquivo garantida</strong></td>
      <td>Arquivos brutos armazenados de forma imutável e com hash SHA-256 persistido no banco.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Desvio de quarentena operando</strong></td>
      <td>Registros que apresentarem erro estrutural ou geométrico segregados com o motivo do erro registrado.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Bateria de testes aprovada</strong></td>
      <td>Testes unitários e manuais de ponta a ponta executados sem erros impeditivos.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Documentação atualizada</strong></td>
      <td>READMEs e especificações técnicas de endpoints e esquemas salvas no repositório.</td>
      <td align="center">🟡</td>
    </tr>
    <tr>
      <td><strong>Demonstração realizada</strong></td>
      <td>Incremento funcional demonstrado em funcionamento durante a Sprint Review.</td>
      <td align="center">🟡</td>
    </tr>
  </tbody>
</table>

<br>

<h2 id="modelodados">🗄️ Modelo de Dados</h2>

<table width="100%">
  <thead>
    <tr>
      <th align="center">Diagrama Entidade-Relacionamento (Sprint 1)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">
        <img src="../../bds/Modelagem%20Banco%20de%20Dados.png" alt="Modelo de Dados GeoRural DataHub - Sprint 1" width="100%">
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
      <td>O vídeo demonstrando o pipeline da Sprint 1 em execução será incluído aqui após o término das entregas e validação com o cliente.</td>
    </tr>
  </tbody>
</table>