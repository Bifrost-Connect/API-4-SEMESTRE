# 🧪 Relatório de Testes - Sprint 1 (GeoRural DataHub)

Este documento registra as validações das funcionalidades da primeira Sprint do projeto para a Visiona Tecnologia Espacial, incluindo o escopo inicial e o refinamento do motor de triagem para a Quarentena.

---

### 🧩 Funcionalidades Testadas (Sprint 1)

| ID | Funcionalidade | Tipo de Teste | Objetivo | Resultado |
|:---|:---|:---|:---|:---:|
| T01 | Cadastro de Origem e Metadados (US-01) | Funcional | Validar cadastro de datasets com órgão, safra (YYYY) e projeção EPSG:4674. | ✅ Aprovado |
| T02 | Validação de Campos Obrigatórios (US-01) | Negativo | Bloquear submissão com campos nulos, formatos inválidos ou safras fora do range. | ✅ Aprovado |
| T03 | Ingestão na Zona Bruta (US-02) | Funcional | Fazer upload e armazenar o arquivo vetorial original sem modificações estruturais. | ✅ Aprovado |
| T04 | Validação de Formatos Aceitos (US-02) | Segurança | Bloquear uploads fora do padrão (.zip com Shapefile, .geojson, .kml). | ✅ Aprovado |
| T05 | Persistência e Metadados de Carga (US-02) | Integração | Garantir gravação da URI, tamanho em bytes e data no banco Oracle. | ✅ Aprovado |
| T06 | Monitoramento da Esteira (US-03) | Funcional | Exibir em tempo real as fases do pipeline na interface com status de execução. | ✅ Aprovado |
| T07 | Disparo e Integração Airflow (US-03) | Integração | Validar acionamento da DAG de carga e sincronização de telemetria via API. | ✅ Aprovado |
| T08 | Identificação Visual de Falhas (US-03) | Resiliência | Confirmar nó em vermelho e log resumido em caso de interrupção forçada da task. | ✅ Aprovado |
| T09 | Triagem de Registros Inválidos (US-04) | Funcional | Identificar polígonos autointersectados, anéis abertos ou duplicidades de cadastro. | 🟡 Parcial |
| T10 | Isolamento e Desvio para Quarentena (US-04) | Integração | Segregar registros com anomalias na tabela de quarentena com motivo de rejeição. | 🟡 Parcial |

---

### 🧾 Evidências da Sprint 1

As validações da entrega foram consolidadas:

- ✅ **Metadados Territoriais (US-01):** Registro padronizado de órgãos (IBAMA, INCRA, MapBiomas, SICAR) com sistema SIRGAS 2000 (EPSG:4674).
- ✅ **Zona Bruta Íntegra (US-02):** Preservação integral do documento de origem no Object Storage para auditorias futuras.
- ✅ **Esteira Operacional (US-03):** Linha do tempo visual em Vue.js refletindo com precisão as transições de status da orquestração no Apache Airflow.
- 🟡 **Filtro e Quarentena (US-04):** Estrutura da tabela de quarentena criada no Oracle e validações preliminares de integridade geométrica integradas, com conclusão e refinamento do motor de regras planejado para a Sprint 2.

<br>

### 🎬 Demonstração em Vídeo - Sprint 1

Confira a execução das funcionalidades acima rodando na aplicação:

[![YouTube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)]( )