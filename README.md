# 🧠 Strong Memory - Full Stack Environment

Ambiente completo da aplicação **Strong Memory (SM)** utilizando Docker Compose.

Este projeto permite subir toda a aplicação (frontend + backend + banco de dados) com apenas um comando, facilitando testes, demonstração e avaliação por recrutadores.

<br/>

## 🚀 Sobre o Projeto

O **Strong Memory (SM)** é uma aplicação web gamificada voltada para o treinamento da memória muscular e cognitiva.

Este repositório contém a infraestrutura necessária para executar o sistema completo:

- 🎮 Frontend (Angular)
- ⚙️ Backend (Spring Boot API)
- 🗄️ Banco de dados (MySQL)

<br/>

## 🧩 Arquitetura do Sistema

```text
Frontend (Angular)
        ↓
Backend API (Spring Boot)
        ↓
MySQL Database
```

<br/>

## 🐳 Serviços Docker

| Serviço      | Descrição                      |
| ------------ | ------------------------------ |
| frontend-web | Interface web da aplicação     |
| backend-api  | API REST com regras de negócio |
| mysql-db     | Banco de dados MySQL           |

<br/>

## ⚙️ Pré-requisitos

- Docker
- Docker Compose

<br/>

## 🚀 Como Executar

```bash
# Clonar repositório
git clone https://github.com/renan-teles/strong-memory-docker.git

# Acessar pasta do projeto
cd strong-memory-docker
```

## 🔐 Configuração de Ambiente

Copie o arquivo `.env.example` para `.env` e edite conforme necessário.

### 🐧 Linux / macOS / Git Bash

```bash
cp .env.example .env
nano .env
```

### 🪟 Windows (Prompt de Comando - CMD)

```bash
copy .env.example .env
notepad .env
```

### 🪟 Windows (PowerShell)

```bash
Copy-Item .env.example .env
notepad .env
```

## ▶️ Subindo a aplicação

```bash
docker-compose up -d
```

<br/>

## 🌐 Acessos

Após subir o ambiente:

- Frontend: http://localhost:4200/auth/player/login
- Backend API: http://localhost:8080

<br/>

## 🔐 Variáveis de Ambiente

As configurações da aplicação são feitas através de variáveis de ambiente.

O projeto utiliza um arquivo `.env`, que deve ser criado a partir do modelo disponível em:

```bash
.env.example
```

### 📌 Principais configurações:

- Conexão com banco de dados (MySQL)
- Credenciais da API
- Configuração de CORS
- Porta da aplicação
- URL da API consumida pelo frontend

### ⚠️ Importante

O arquivo `.env` não é versionado por conter dados sensíveis.

<br/>

## 🗄️ Banco de Dados

- Banco inicial: `strong_memory_db`
- Scripts SQL executados automaticamente via volume:

```text
./sql → /docker-entrypoint-initdb.d
```

<br/>

## ❤️ Health Checks

O ambiente utiliza verificações automáticas para garantir que os serviços estejam prontos:

- MySQL → valida conexão com query simples
- API → endpoint `/actuator/health`
- Frontend → depende da API estar saudável

<br/>

## 🔗 Repositórios Relacionados

- Backend API: https://github.com/renan-teles/StrongMemoryAPI
- Frontend Web: https://github.com/renan-teles/strong-memory-web-app

<br/>

## 📈 Objetivo do Projeto

Este ambiente foi criado com foco em:

- Demonstrar integração entre múltiplos serviços
- Simular um ambiente real de execução
- Facilitar testes e validação do sistema
- Evidenciar conhecimentos em Docker e arquitetura distribuída

<br/>

## 👨‍💻 Autor

**Renan Lopes Lima Teles**

- GitHub: https://github.com/renan-teles
<!-- LinkedIn: https://linkedin.com/in/seu-perfil -->

<br/>

## 📌 Observações

Este projeto faz parte de um conjunto de aplicações desenvolvidas para estudo e prática de:

- Desenvolvimento Full Stack
- APIs REST
- Arquitetura em camadas
- Containerização com Docker

<!--
💡 _Com apenas um comando, é possível executar toda a aplicação — simulando um ambiente próximo ao de produção._
-->
