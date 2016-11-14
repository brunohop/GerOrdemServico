
CREATE TABLE PENTAHO.PGT_CATALOGO (
                PGT_CATLID NUMERIC(18) NOT NULL,
                NOME_IDEMCATALOGO_A VARCHAR(500) NOT NULL,
                CONSTRAINT pgt_catalogo_pk PRIMARY KEY (PGT_CATLID)
);
COMMENT ON TABLE PENTAHO.PGT_CATALOGO IS 'Aramazena o item do catalogo de servicos da tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_CATALOGO.PGT_CATLID IS 'Armazena o Catalogo de Servicos de uma Tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_CATALOGO.NOME_IDEMCATALOGO_A IS 'Nomo do catalogo no Redmine.';


CREATE TABLE PENTAHO.PGT_PRODUTO (
                PGT_PRODID NUMERIC(18) NOT NULL,
                NOME_PRODUTO_A VARCHAR(300) NOT NULL,
                CONSTRAINT pgt_produto_pk PRIMARY KEY (PGT_PRODID)
);
COMMENT ON TABLE PENTAHO.PGT_PRODUTO IS 'Armazena o Produto(Sistema) da Tarefa';
COMMENT ON COLUMN PENTAHO.PGT_PRODUTO.PGT_PRODID IS 'Armazena os produtos/sistemas para uma Tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_PRODUTO.NOME_PRODUTO_A IS 'Nome do produto no Redmine.';


CREATE TABLE PENTAHO.PGT_DEBITOTECNICO (
                PGT_DEBTID NUMERIC(18) NOT NULL,
                DESC_DEBITOTECNICO_A VARCHAR(1000) NOT NULL,
                CONSTRAINT pgt_debitotecnico_pk PRIMARY KEY (PGT_DEBTID)
);
COMMENT ON TABLE PENTAHO.PGT_DEBITOTECNICO IS 'Aramazena Debitos tecnicos do sistema. Pode ser da OS, da Tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_DEBITOTECNICO.PGT_DEBTID IS 'PK da tabela.';
COMMENT ON COLUMN PENTAHO.PGT_DEBITOTECNICO.DESC_DEBITOTECNICO_A IS 'Texto do debito tecnico.';


CREATE TABLE PENTAHO.PGT_TIPOOS (
                PGT_TIPOOSID NUMERIC(18) NOT NULL,
                NOME_TIPOOS_A VARCHAR(200) NOT NULL,
                CONSTRAINT pgt_tipoos_pk PRIMARY KEY (PGT_TIPOOSID)
);
COMMENT ON TABLE PENTAHO.PGT_TIPOOS IS 'Tipo da OS: Construcao; Manutencao; Infra; Banco; Garantia; Suporte; Projeto;';
COMMENT ON COLUMN PENTAHO.PGT_TIPOOS.PGT_TIPOOSID IS 'PK DA TABELA.';
COMMENT ON COLUMN PENTAHO.PGT_TIPOOS.NOME_TIPOOS_A IS 'Tipo da OS: Contrucao, Matutencao, Infra, Banco, Suporte; Projeto;';


CREATE TABLE PENTAHO.PGT_ENTREGAVEL (
                PGT_ENTREGAVELID NUMERIC(18) NOT NULL,
                NOME_ENTREGAVEL_A VARCHAR(250) NOT NULL,
                NUMR_ATIVO_N VARCHAR(1) DEFAULT 1 NOT NULL,
                CONSTRAINT pgt_entregavel_pk PRIMARY KEY (PGT_ENTREGAVELID)
);
COMMENT ON TABLE PENTAHO.PGT_ENTREGAVEL IS 'Armazena os entregaveis previstos na MGDA';
COMMENT ON COLUMN PENTAHO.PGT_ENTREGAVEL.NOME_ENTREGAVEL_A IS 'Nome do Entregavel conforme MGDA';
COMMENT ON COLUMN PENTAHO.PGT_ENTREGAVEL.NUMR_ATIVO_N IS ' 1, entao ativo, se 0 entao inativo.';


CREATE TABLE PENTAHO.PGT_PROJETO (
                PGT_PROJID NUMERIC(18) NOT NULL,
                NOME_PROJETO_A VARCHAR(300) NOT NULL,
                NUMR_IDPROJREDMINE_N NUMERIC(18) NOT NULL,
                CONSTRAINT pgt_projeto_pk PRIMARY KEY (PGT_PROJID)
);
COMMENT ON TABLE PENTAHO.PGT_PROJETO IS 'Armazena os dados do Projeto.';
COMMENT ON COLUMN PENTAHO.PGT_PROJETO.NOME_PROJETO_A IS 'Nome do Projeto no Redmine.';
COMMENT ON COLUMN PENTAHO.PGT_PROJETO.NUMR_IDPROJREDMINE_N IS 'Aramzena o ID do projeto no Redmine';


CREATE TABLE PENTAHO.PGT_PESSOA (
                PGT_PESID NUMERIC(18) NOT NULL,
                NOME_PESSOA_A VARCHAR(300) NOT NULL,
                NOME_VINCULO_A VARCHAR(300) NOT NULL,
                NUMR_IDPESSOAREDMINE_N NUMERIC(18) NOT NULL,
                CONSTRAINT pgt_pessoa_pk PRIMARY KEY (PGT_PESID)
);
COMMENT ON TABLE PENTAHO.PGT_PESSOA IS 'Armazena dados das pessoas envolvidadas no processo.';
COMMENT ON COLUMN PENTAHO.PGT_PESSOA.NOME_VINCULO_A IS 'Informa se o vinculo: TCE; Contratada.';
COMMENT ON COLUMN PENTAHO.PGT_PESSOA.NUMR_IDPESSOAREDMINE_N IS 'Informa o ID da pessoa no Redmine.';


CREATE TABLE PENTAHO.PGT_ORDEMSERVICO (
                PGT_OSID NUMERIC(18) NOT NULL,
                PGT_FICALCONTRATO_N NUMERIC(18) NOT NULL,
                PGT_PROJID NUMERIC(18) NOT NULL,
                PGT_PREPOSTO_N NUMERIC(18) NOT NULL,
                PGT_RESPTECNICO_N NUMERIC(18) NOT NULL,
                NOME_OS_A VARCHAR(300) NOT NULL,
                DATA_INICIO_D DATE NOT NULL,
                DATA_PREVISAO_D DATE NOT NULL,
                DATA_FIM_D DATE NOT NULL,
                NOME_SITUACAO_A VARCHAR(50) NOT NULL,
                PGT_RESPREQUISITANTE_N NUMERIC(18) NOT NULL,
                PGT_TIPOOSID NUMERIC(18) NOT NULL,
                NUMR_FATORATENDIMENTO_N NUMERIC(18,2) NOT NULL,
                NUMR_USTPAGO_N NUMERIC(18,2) NOT NULL,
                NUMR_USTGLOSA_N NUMERIC(18,2) NOT NULL,
                CONSTRAINT pgt_ordemservico_pk PRIMARY KEY (PGT_OSID)
);
COMMENT ON TABLE PENTAHO.PGT_ORDEMSERVICO IS 'Armazena as OS.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.PGT_FICALCONTRATO_N IS 'PK Pessoa que identifica o Fiscal da OS.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.PGT_PROJID IS 'FK do projeto';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.PGT_PREPOSTO_N IS 'PK Pessoa que identifica o Preposto.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.PGT_RESPTECNICO_N IS 'PK Pessoa que identifica o Responsavel Tecnico.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.NOME_OS_A IS 'Nome da OS: <Numero> - <Projeto> - <Refencia>';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.DATA_INICIO_D IS 'Data que a OS comeca a valer.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.DATA_PREVISAO_D IS 'Data de previsao do fim da OS';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.DATA_FIM_D IS 'Data real que a OS termina.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.NOME_SITUACAO_A IS 'Situacao da OS: Fechada, Aberta, Rejeitada.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.PGT_RESPREQUISITANTE_N IS 'PK Pessoa que identifica o Requisitante da OS.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.PGT_TIPOOSID IS 'FK para tabela TIPo da OS.';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.NUMR_FATORATENDIMENTO_N IS 'Valor do Fator de Atendimento da OS: 0 a 1';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.NUMR_USTPAGO_N IS 'Contem o valor UST pago na OS SEM A GLOSA';
COMMENT ON COLUMN PENTAHO.PGT_ORDEMSERVICO.NUMR_USTGLOSA_N IS 'Contem o valor da GLOSA da OS';


CREATE TABLE PENTAHO.PGT_OSNIVELSERVICO (
                PGT_OSNSID NUMERIC(18,2) NOT NULL,
                PGT_OSID NUMERIC(18) NOT NULL,
                DESC_NIVELSERVICO_A VARCHAR(300) NOT NULL,
                DESC_INDICADOR_A VARCHAR(100) NOT NULL,
                CONSTRAINT pgt_osnivelservico_pk PRIMARY KEY (PGT_OSNSID)
);
COMMENT ON COLUMN PENTAHO.PGT_OSNIVELSERVICO.PGT_OSNSID IS 'PK DA TABELA.';
COMMENT ON COLUMN PENTAHO.PGT_OSNIVELSERVICO.PGT_OSID IS 'FK da OS';
COMMENT ON COLUMN PENTAHO.PGT_OSNIVELSERVICO.DESC_NIVELSERVICO_A IS 'Nivel de servico atingido: N�VEL 1, N�VEL 2 OU N�VEL 3.';
COMMENT ON COLUMN PENTAHO.PGT_OSNIVELSERVICO.DESC_INDICADOR_A IS 'Indicador do n�vel de servico: ICE; IDTU.';


CREATE TABLE PENTAHO.PGT_OSDEBTECNICO (
                PGT_OSDEBTEID NUMERIC(18) NOT NULL,
                PGT_DEBTID NUMERIC(18) NOT NULL,
                PGT_OSID NUMERIC(18) NOT NULL,
                CONSTRAINT pgt_osdebtecnico_pk PRIMARY KEY (PGT_OSDEBTEID)
);
COMMENT ON TABLE PENTAHO.PGT_OSDEBTECNICO IS 'Relacina a OS com Debito Tecnico.';
COMMENT ON COLUMN PENTAHO.PGT_OSDEBTECNICO.PGT_OSDEBTEID IS 'PK da tabela.';
COMMENT ON COLUMN PENTAHO.PGT_OSDEBTECNICO.PGT_DEBTID IS 'FK do debito tecnico.';
COMMENT ON COLUMN PENTAHO.PGT_OSDEBTECNICO.PGT_OSID IS 'FK da OS.';


CREATE TABLE PENTAHO.PGT_TAREFASOS (
                PTG_TAREID NUMERIC(18) NOT NULL,
                PGT_CATLID NUMERIC(18),
                PGT_PRODID NUMERIC(18),
                PGT_PESABERTURATAREFA_N NUMERIC(18) NOT NULL,
                PGT_TAREFAATRIBUIDA_N NUMERIC(18) NOT NULL,
                PGT_ENTREGAVELID NUMERIC(18) NOT NULL,
                PGT_OSID NUMERIC(18) NOT NULL,
                NUMR_IDTAREFAREDMNINE_N NUMERIC(18) NOT NULL,
                NUMR_USTTAREFA_N NUMERIC(18,2) NOT NULL,
                NURM_HORASTAREFA_N NUMERIC(18,2) NOT NULL,
                CONSTRAINT pgt_tarefasos_pk PRIMARY KEY (PTG_TAREID)
);
COMMENT ON TABLE PENTAHO.PGT_TAREFASOS IS 'Mapeia as tarefas da OS.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.PGT_CATLID IS 'FK do Catalogo de Servicos de uma Tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.PGT_PRODID IS 'Armazena os produtos/sistemas para uma Tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.PGT_PESABERTURATAREFA_N IS 'FK da pessoa que ABRIU/CADASTROU a tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.PGT_TAREFAATRIBUIDA_N IS 'FK da pessoa atribuida na tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.PGT_ENTREGAVELID IS 'FK do entregavel da Tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.PGT_OSID IS 'FK da OS da tarefa.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.NUMR_IDTAREFAREDMNINE_N IS 'ID da tarefa no Redmine.';
COMMENT ON COLUMN PENTAHO.PGT_TAREFASOS.NUMR_USTTAREFA_N IS 'Calculo da UST da tarefa.';


CREATE TABLE PENTAHO.PGT_TAREFA_DEBTECNICO (
                PGT_TARDEBTID NUMERIC(18) NOT NULL,
                PTG_TAREID NUMERIC(18) NOT NULL,
                PGT_DEBTID NUMERIC(18) NOT NULL,
                CONSTRAINT pgt_tarefa_debtecnico_pk PRIMARY KEY (PGT_TARDEBTID)
);
COMMENT ON TABLE PENTAHO.PGT_TAREFA_DEBTECNICO IS 'Relaciona a Tarefa ao Debito Tecnico. Uma terefa pode ter mais de um debito tecnico. ';
COMMENT ON COLUMN PENTAHO.PGT_TAREFA_DEBTECNICO.PTG_TAREID IS 'FK da tarefa.';


CREATE TABLE PENTAHO.PGT_OSENTREGAVEL (
                PGT_OSENTRID NUMERIC(18) NOT NULL,
                PGT_ENTREGAVELID NUMERIC(18) NOT NULL,
                PGT_OSID NUMERIC(18) NOT NULL,
                NUMR_USTPREVISTO_N NUMERIC NOT NULL,
                CONSTRAINT pgt_osentregavel_pk PRIMARY KEY (PGT_OSENTRID)
);
COMMENT ON TABLE PENTAHO.PGT_OSENTREGAVEL IS 'Tabela de relacionamento NxN entre OS e Entregavel.';
COMMENT ON COLUMN PENTAHO.PGT_OSENTREGAVEL.PGT_OSENTRID IS 'PK';
COMMENT ON COLUMN PENTAHO.PGT_OSENTREGAVEL.PGT_ENTREGAVELID IS 'FK entregavel';
COMMENT ON COLUMN PENTAHO.PGT_OSENTREGAVEL.PGT_OSID IS 'FK da OS';
COMMENT ON COLUMN PENTAHO.PGT_OSENTREGAVEL.NUMR_USTPREVISTO_N IS 'Valor UST previsto para o Entregavel na OS';


ALTER TABLE PENTAHO.PGT_TAREFASOS ADD CONSTRAINT pgt_catalogo_pgt_tarefasos_fk
FOREIGN KEY (PGT_CATLID)
REFERENCES PENTAHO.PGT_CATALOGO (PGT_CATLID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_TAREFASOS ADD CONSTRAINT pgt_produto_pgt_tarefasos_fk
FOREIGN KEY (PGT_PRODID)
REFERENCES PENTAHO.PGT_PRODUTO (PGT_PRODID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_OSDEBTECNICO ADD CONSTRAINT pgt_debitotecnico_pgt_osdebtecnico_fk
FOREIGN KEY (PGT_DEBTID)
REFERENCES PENTAHO.PGT_DEBITOTECNICO (PGT_DEBTID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_TAREFA_DEBTECNICO ADD CONSTRAINT pgt_debitotecnico_pgt_tarefa_debtecnico_fk
FOREIGN KEY (PGT_DEBTID)
REFERENCES PENTAHO.PGT_DEBITOTECNICO (PGT_DEBTID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_ORDEMSERVICO ADD CONSTRAINT pgt_tipoos_pgt_ordemservico_fk
FOREIGN KEY (PGT_TIPOOSID)
REFERENCES PENTAHO.PGT_TIPOOS (PGT_TIPOOSID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_OSENTREGAVEL ADD CONSTRAINT pgt_entregavel_pgt_osentregavel_fk
FOREIGN KEY (PGT_ENTREGAVELID)
REFERENCES PENTAHO.PGT_ENTREGAVEL (PGT_ENTREGAVELID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_TAREFASOS ADD CONSTRAINT pgt_entregavel_pgt_tarefasremuneradas_fk
FOREIGN KEY (PGT_ENTREGAVELID)
REFERENCES PENTAHO.PGT_ENTREGAVEL (PGT_ENTREGAVELID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_ORDEMSERVICO ADD CONSTRAINT pgt_projeto_pgt_ordemservico_fk
FOREIGN KEY (PGT_PROJID)
REFERENCES PENTAHO.PGT_PROJETO (PGT_PROJID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_ORDEMSERVICO ADD CONSTRAINT pgt_pessoa_pgt_ordemservico_fk
FOREIGN KEY (PGT_RESPTECNICO_N)
REFERENCES PENTAHO.PGT_PESSOA (PGT_PESID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_ORDEMSERVICO ADD CONSTRAINT pgt_pessoa_pgt_ordemservico_fk1
FOREIGN KEY (PGT_RESPREQUISITANTE_N)
REFERENCES PENTAHO.PGT_PESSOA (PGT_PESID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_ORDEMSERVICO ADD CONSTRAINT pgt_pessoa_pgt_ordemservico_fk2
FOREIGN KEY (PGT_PREPOSTO_N)
REFERENCES PENTAHO.PGT_PESSOA (PGT_PESID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_ORDEMSERVICO ADD CONSTRAINT pgt_pessoa_pgt_ordemservico_fk3
FOREIGN KEY (PGT_FICALCONTRATO_N)
REFERENCES PENTAHO.PGT_PESSOA (PGT_PESID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_TAREFASOS ADD CONSTRAINT pgt_pessoa_pgt_tarefasos_fk
FOREIGN KEY (PGT_TAREFAATRIBUIDA_N)
REFERENCES PENTAHO.PGT_PESSOA (PGT_PESID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_TAREFASOS ADD CONSTRAINT pgt_pessoa_pgt_tarefasos_fk1
FOREIGN KEY (PGT_PESABERTURATAREFA_N)
REFERENCES PENTAHO.PGT_PESSOA (PGT_PESID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_OSENTREGAVEL ADD CONSTRAINT pgt_ordemservico_pgt_osentregavel_fk
FOREIGN KEY (PGT_OSID)
REFERENCES PENTAHO.PGT_ORDEMSERVICO (PGT_OSID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_TAREFASOS ADD CONSTRAINT pgt_ordemservico_pgt_tarefasremuneradas_fk
FOREIGN KEY (PGT_OSID)
REFERENCES PENTAHO.PGT_ORDEMSERVICO (PGT_OSID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_OSDEBTECNICO ADD CONSTRAINT pgt_ordemservico_pgt_osdebtecnico_fk
FOREIGN KEY (PGT_OSID)
REFERENCES PENTAHO.PGT_ORDEMSERVICO (PGT_OSID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_OSNIVELSERVICO ADD CONSTRAINT pgt_ordemservico_pgt_osnivelservico_fk
FOREIGN KEY (PGT_OSID)
REFERENCES PENTAHO.PGT_ORDEMSERVICO (PGT_OSID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE PENTAHO.PGT_TAREFA_DEBTECNICO ADD CONSTRAINT pgt_tarefasos_pgt_tarefa_debtecnico_fk
FOREIGN KEY (PTG_TAREID)
REFERENCES PENTAHO.PGT_TAREFASOS (PTG_TAREID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
