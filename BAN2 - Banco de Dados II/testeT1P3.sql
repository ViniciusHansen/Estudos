-- Testando gatilho do CPF existente e validação
-----------------------------------------------------------

-- Inserindo um CPF inválido
INSERT INTO "Pessoa Fisica" (cpf, codigo_cliente) VALUES ('12345678900', 1); -- Deve acionar o gatilho de CPF inválido

-- Inserindo um CPF válido mas repetido
INSERT INTO "Pessoa Fisica" (cpf, codigo_cliente) VALUES ('52998224725', 2); -- Primeira inserção válida
INSERT INTO "Pessoa Fisica" (cpf, codigo_cliente) VALUES ('52998224725', 3); -- Deve acionar o gatilho de CPF existente

-- Testando gatilho do CNPJ válido
-----------------------------------------------------------

-- Inserindo um CNPJ inválido (menos que 14 dígitos e não termina em 0001)
INSERT INTO "Pessoa Juridica" (cnpj, codigo_cliente) VALUES ('1234567890', 4); -- Deve acionar o gatilho de CNPJ inválido

-- Inserindo um CNPJ válido mas que não termina em 0001
INSERT INTO "Pessoa Juridica" (cnpj, codigo_cliente) VALUES ('12345678901234', 5); -- Deve acionar o gatilho de CNPJ inválido

-- Testando gatilho da data de início e fim do pacote
-----------------------------------------------------------

-- Inserindo um pacote onde a data de início é após a data de fim
INSERT INTO "Pacote_Visita" ("Pacote_codigo", "Visita_codigo", "datahora_ini", "datahora_fim")
VALUES (1, 1, '2023-09-30 15:00:00', '2023-09-30 14:00:00'); -- Deve acionar o gatilho da data de início e fim

-- Inserindo um pacote com datas válidas
INSERT INTO "Pacote_Visita" ("Pacote_codigo", "Visita_codigo", "datahora_ini", "datahora_fim")
VALUES (2, 2, '2023-09-29 10:00:00', '2023-09-30 15:00:00'); -- Inserção válida

