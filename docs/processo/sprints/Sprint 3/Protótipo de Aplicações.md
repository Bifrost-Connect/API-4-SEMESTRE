# 🧪 Relatório de Testes - Sprint 3 (GeoRural DataHub)

Este documento registra as validações das funcionalidades da terceira Sprint do projeto para a **Visiona Tecnologia Espacial**, cobrindo o consumo externo, a análise temporal e a governança do acervo: Comparação temporal de safras (US-10), Exportação estruturada em CSV/GeoJSON (US-11), Chaves de API para integradores externos (US-12) e Controle de acesso por perfis RBAC (US-13), além da Ingestão automática por conectores oficiais (SICAR/CAR) que alimenta a esteira de cargas.

Os testes foram executados com o back-end na `main` (Spring Boot + PostGIS) e o front-end (Vue.js) rodando localmente sobre um banco zerado, usando dados reais de imóveis rurais do CAR do Paraná obtidos pelo GeoServer oficial do SICAR.

---

### 🧩 Funcionalidades Testadas (Sprint 3)

| ID | Funcionalidade | Tipo de Teste | Objetivo | Resultado |
|:---|:---|:---|:---|:---:|
| T01 | Teste de Conexão do Conector SICAR (Ingestão Automática) | Integração | Validar a conectividade com o GeoServer oficial do CAR (`geoserver.car.gov.br`) via OGC WFS antes da execução. | ✅ Aprovado |
| T02 | Execução do Conector e Criação de Carga (Ingestão Automática) | Integração / Resiliência | Baixar os imóveis do CAR e abrir uma carga na esteira, usando o fallback local quando o Airflow está indisponível. | ✅ Aprovado |
| T03 | Gate de Decisão do Gestor até a Publicação | Funcional / Fluxo | Aprovar Validação, Tratamento e Publicação pela interface, fechando a versão oficial e liberando-a no catálogo. | ✅ Aprovado |
| T04 | Seleção de Safras e Recorte Geográfico (US-10) | Funcional | Permitir apenas versões publicadas e fechadas do mesmo conjunto, com recorte por coordenadas (bbox). | ✅ Aprovado |
| T05 | Mapas Sincronizados e Cortina Deslizante (US-10) | Interface / Usabilidade | Exibir as duas safras lado a lado com câmera sincronizada e no modo cortina (swipe) com destaque de evolução. | ✅ Aprovado |
| T06 | Indicadores de Evolução Temporal (US-10) | Funcional / Precisão | Calcular área da safra A e B, diferença absoluta, variação percentual, áreas novas, reduzidas e mantidas. | ✅ Aprovado |
| T07 | Pré-visualização da Exportação (US-11) | Funcional | Exibir amostra do arquivo com códigos CAR, contagem de registros e tamanho estimado antes do download. | ✅ Aprovado |
| T08 | Download em GeoJSON com Metadados Oficiais (US-11) | Integração | Gerar o arquivo via streaming acompanhado de versão, data de publicação, EPSG e hash de origem. | ✅ Aprovado |
| T09 | Histórico de Exportações Rastreável (US-11) | Auditoria | Registrar cada download com solicitante, data/hora, base/versão, formato e quantidade de registros. | ✅ Aprovado |
| T10 | Emissão de Chave de API com Exibição Única (US-12) | Segurança | Gerar chave de alta entropia exibida uma única vez, armazenando no servidor apenas o hash SHA-256. | ✅ Aprovado |
| T11 | Consumo Externo Autenticado por `X-API-Key` (US-12) | Integração / Segurança | Consultar `GET /api/v1/externo/catalogo` com a chave válida e receber o catálogo publicado. | ✅ Aprovado |
| T12 | Revogação Imediata da Chave (US-12) | Segurança / Negativo | Revogar a chave pelo painel e confirmar que a mesma chamada passa a ser recusada na hora (`401 API_KEY_REVOGADA`). | ✅ Aprovado |
| T13 | Resposta Padronizada sem Credencial (US-12) | Segurança / Negativo | Retornar `401` em JSON (`API_KEY_AUSENTE`) para chamadas externas sem o header `X-API-Key`. | ✅ Aprovado |
| T14 | Bloqueio de Rota por Perfil (US-13) | Segurança / RBAC | Impedir que o Operador acesse o Gerenciamento de Usuários, redirecionando para a tela de acesso negado. | ✅ Aprovado |
| T15 | Matriz de Cargos, Permissões e Auditoria de Segurança (US-13) | Funcional / Governança | Exibir os 5 perfis oficiais, as permissões por módulo com segregação de funções e a trilha de auditoria de segurança. | ✅ Aprovado |
| T16 | Comparação Temporal com o Perfil Analista (US-10 / US-13) | Segurança / RBAC | Executar a comparação logado como Analista, perfil para o qual a tela é exibida no menu. | ❌ Reprovado |

---

### 🧾 Evidências da Sprint 3

As validações da entrega foram consolidadas:

- ✅ **Ingestão Automática de Fontes Oficiais:** O conector do SICAR foi testado e executado pela interface, trazendo imóveis reais do CAR do Paraná (cargas de 200 e 350 feições). Com o Airflow indisponível, o fallback local assumiu a execução e a carga entrou na esteira normalmente.
- ✅ **Esteira com Decisão do Gestor até a Publicação:** A validação topológica detectou sobreposições entre imóveis e reteve a carga para o Gestor, que aprovou Validação, Tratamento e Publicação pela tela. A versão `1.0` foi fechada, ficou imutável e passou a aparecer no catálogo como disponível.
- ✅ **Comparação Temporal de Safras (US-10):** Comparação entre duas versões publicadas no recorte do norte do Paraná (`-51.33, -23.77, -50.90, -23.17`), com mapas sincronizados, cortina deslizante e indicadores calculados no PostGIS: **7.718,39 ha** na safra A, **12.522,06 ha** na safra B, diferença de **+4.803,67 ha** e variação de **+62,24%**.
- ✅ **Exportação Estruturada e Rastreável (US-11):** Pré-visualização com 350 registros e códigos CAR reais, download em GeoJSON com metadados oficiais (versão, publicação, EPSG 4674 e hash de origem) e registro automático de cada exportação no histórico.
- ✅ **Chaves de API com Revogação Imediata (US-12):** Emissão da chave com exibição única e escopos (`CATALOGO_CONSULTAR`, `MAPA_CONSULTAR`), consumo externo com resposta `200`, revogação pelo painel e bloqueio instantâneo da mesma chave com `401` padronizado em JSON.
- ✅ **Controle de Acesso por Perfil (US-13):** Menus e rotas segregados entre Operador, Auditor, Analista, Gestor e Administrador; a tentativa do Operador de abrir o gerenciamento de usuários é bloqueada, e a matriz de permissões e a auditoria de segurança estão disponíveis ao Administrador.

<br>

### 🔧 Correções Aplicadas Durante os Testes

Ao validar a ingestão do CAR em um banco zerado, foi identificado que a publicação pela interface falhava porque partes do sistema usavam o usuário de id `1` fixo, removido pela migration `V50`. As correções já foram integradas à `main`:

| Repositório | Arquivo | Correção |
|:---|:---|:---|
| Front-end | `src/components/process-stages/ProcessStagePublicacao.vue` | **Aprovar e Publicar** e **Reprovar Carga** passam a enviar o id do gestor logado em vez de `gestorId: 1`. |
| Back-end | `controller/CargaController.java` e `controller/ProcessoController.java` | Upload, processar, reprocessar, cancelar e notificar-operador passam a usar o usuário logado quando o `usuarioId` não é informado. |
| Back-end | `security/UsuarioSessaoService.java` | Novo método `idUsuarioLogado()` para obter o usuário autenticado pelo JWT. |
| Back-end | `repository/ProcessoDashboardRepository.java` | Consulta da quarentena corrigida de `ov.contexto` (coluna inexistente) para `ov.detalhes`, voltando a listar as ocorrências na tela do processo. |

<br>

### ⚠️ Pendências Identificadas

- ❌ **Analista sem permissão de comparar safras (T16):** O perfil `ANALISTA` não possui `COMPARAR_SAFRAS` em `MatrizPermissoes.java`, então a API retorna `403`, embora o front exiba a tela de comparação para esse perfil. Nos testes, a comparação foi validada com o perfil Gestor.
- ⚠️ **Contagem por imóvel na comparação (US-10):** O indicador "Imóveis com agravamento / redução" ainda não recebe dados do back-end.
- ⚠️ **Filtro por região/município na exportação (US-11):** O campo existe na tela, mas aguarda o parâmetro correspondente na API.
- ⚠️ **Testes de integração do back-end:** 6 dos 326 testes falham na `main` (chaves de API externas, permissões customizadas e cenários de cancelamento/notificação que dependem dos usuários de teste removidos pela `V50`).

<br>

### 🎬 Demonstração em Vídeo - Sprint 3

Confira a execução das funcionalidades da Sprint 3 rodando na aplicação, da ingestão do CAR até o consumo externo por chave de API:

[![YouTube Badge]( )]( )
