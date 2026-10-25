# 🧪 Relatório de Testes - Sprint 2 (GeoRural DataHub)

Este documento registra as validações das funcionalidades da segunda Sprint do projeto para a **Visiona Tecnologia Espacial**, cobrindo o fechamento da Quarentena (US-04 remanejada da Sprint 1) e o núcleo analítico espacial: Linhagem retrospectiva (US-05), Cruzamento territorial (US-06), Imutabilidade de versões (US-07), Visualização em mapa interativo (US-08) e Catálogo operacional de dados (US-09).

---

### 🧩 Funcionalidades Testadas (Sprint 2)

| ID | Funcionalidade | Tipo de Teste | Objetivo | Resultado |
|:---|:---|:---|:---|:---:|
| T01 | Motor de Triagem e Quarentena (US-04) | Funcional | Identificar geometrias inválidas (anéis abertos, nós autointersectados) e cadastros duplicados. | ✅ Aprovado |
| T02 | Segregação e Isolamento de Falhas (US-04) | Integração | Desviar registros inconsistentes para `TB_QUARENTENA` com motivo e payload, mantendo a carga dos válidos. | ✅ Aprovado |
| T03 | Rastreabilidade e Linhagem Ponta a Ponta (US-05) | Funcional | Reconstituir retrospectivamente a trilha do indicador até o arquivo bruto de origem na Zona Bruta. | ✅ Aprovado |
| T04 | Proteção de Consulta de Linhagem (US-05) | Segurança / RBAC | Validar que a rota de linhagem opere em modo somente leitura e restrita a perfis autorizados (Auditor/Analista/Gestor). | ✅ Aprovado |
| T05 | Intersecção Espacial e Cálculo de Áreas (US-06) | Funcional / GIS | Executar intersecção vetorial (CAR vs. Alertas/APPs) calculando área sobreposta em hectares no Oracle Spatial. | ✅ Aprovado |
| T06 | Acurácia Métrica do Cálculo Territorial (US-06) | Regressão / Precisão | Confrontar o cálculo analítico em PL/SQL com o padrão de referência SIG desktop (QGIS) em EPSG:4674. | ✅ Aprovado |
| T07 | Congelamento e Fechamento de Versões (US-07) | Funcional | Homologar safras oficiais gerando código identificador único imutável (ex.: `v2026.1`). | ✅ Aprovado |
| T08 | Trava de Imutabilidade no Banco (US-07) | Integridade / Negativo | Bloquear via triggers/constraints comandos de `UPDATE` e `DELETE` em dados de safras homologadas. | ✅ Aprovado |
| T09 | Renderização Cartográfica e Camadas (US-08) | Interface / Carga | Renderizar mapa interativo em Leaflet com alternância de camadas (CAR, Alertas e Sobreposição) em até 3s. | ✅ Aprovado |
| T10 | Inspeção de Feições no Mapa (US-08) | Usabilidade | Abrir popups com código do imóvel, área sobreposta em hectares e ano da safra ao interagir com polígonos. | ✅ Aprovado |
| T11 | Catálogo Geral e Situação Operacional (US-09) | Integração | Listar o acervo de bases com status de publicação (`DISPONIVEL`, `EM_PROCESSAMENTO`, `PENDENTE_HOMOLOGACAO`). | ✅ Aprovado |
| T12 | Busca e Filtragem no Catálogo (US-09) | Funcional | Filtrar datasets de forma combinada por órgão emissor, ano de safra e tipo de feição territorial. | ✅ Aprovado |

---

### 🧾 Evidências da Sprint 2

As validações da entrega foram consolidadas com sucesso:

- ✅ **Triagem e Quarentena Concluídas (US-04):** Motor de malha fina segregando registros defeituosos na `TB_QUARENTENA` com o log da recusa e payload original, sem interromper o processamento das feições íntegras.
- ✅ **Linhagem e Auditabilidade Completa (US-05):** Resolução da dor central da Visiona, permitindo demonstrar a proveniência exata de cada indicador publicado até o arquivo bruto de entrada e tarefas do pipeline.
- ✅ **Cruzamento Espacial em PL/SQL (US-06):** Rotinas nativas com Oracle Spatial (`SDO_GEOM.SDO_INTERSECTION` e `SDO_GEOM.SDO_AREA`) realizando medições de sobreposições em hectares padronizadas no sistema SIRGAS 2000 (EPSG:4674), com validação métrica equivalente ao QGIS.
- ✅ **Garantia de Imutabilidade Histórica (US-07):** Trava ativada no banco de dados barrando operações de alteração e exclusão sobre safras consolidadas, resguardando a reprodutibilidade de laudos e análises.
- ✅ **Exploração Geográfica Fluida (US-08):** Mapa temático interativo desenvolvido em Leaflet e integrado ao Vue.js, servindo feições vetoriais GeoJSON com visualização rápida e popups informativos.
- ✅ **Governança do Acervo (US-09):** Painel do catálogo operacional ativo, fornecendo à equipe visibilidade imediata de quais bases territoriais estão prontas e homologadas para consumo analítico.

<br>

### 🎬 Demonstração em Vídeo - Sprint 2

Confira a execução das funcionalidades e rotinas analíticas rodando na aplicação:

[![YouTube Badge]( )]( )                        