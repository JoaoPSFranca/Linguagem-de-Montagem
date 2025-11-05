# Linguagem de Montagem

Repositório dedicado aos arquivos e exercícios desenvolvidos durante a disciplina de Linguagem de Montagem do curso de Ciência da Computação.

## Sobre a Disciplina

Esta disciplina aborda os fundamentos da programação em Assembly (x86-64), explorando conceitos de baixo nível e a interação direta com o hardware através de instruções de máquina.

## Assuntos Abordados

### 1. **Fundamentos de Assembly**
- Estrutura básica de programas em Assembly (seções `.data`, `.bss`, `.text`)
- Registradores e manipulação de dados
- Syscalls do Linux (interrupções `int 0x80`)
- Operações com bits e representação binária

### 2. **Entrada e Saída de Dados**
- Leitura de entrada do usuário (syscall 3)
- Impressão de mensagens na tela (syscall 4)
- Manipulação de strings e buffers
- Conversão entre ASCII e valores numéricos

### 3. **Operações Aritméticas**
- Adição, subtração e multiplicação
- Divisão e cálculo de resto
- Conversão de caracteres ASCII para números (`sub r8, '0'`)
- Operações com múltiplas variáveis

### 4. **Estruturas de Controle**
- Comparações (`cmp`)
- Saltos condicionais (`je`, `jg`, `jl`, `jle`)
- Loops e iterações
- Chamadas de funções (`call`)

### 5. **Projetos Práticos**
- **Calculadora**: Implementação de operações matemáticas básicas com menu interativo
- **Função Quadrática**: Cálculo de f(x) = ax² + bx - c
- **Números Primos**: Identificação de números primos em um intervalo
- **Intervalos**: Impressão de números dentro de um intervalo especificado
- **Números Ímpares**: Verificação e impressão de números ímpares

## Compilação e Execução

Para compilar e executar os programas Assembly:

```bash
# Compilar o código
nasm -f elf64 arquivo.asm

# Gerar o executável
ld -s -o exec arquivo.o

# Executar
./exec
```

## Estrutura dos Arquivos

- **Atividade Geral/**: Exercícios práticos básicos
  - Ex1.asm: Manipulação de registradores e bits
  - Ex2-Part1.asm e Ex2-Part2.asm: Impressão de mensagens
  - Ex3-Part1.asm: Leitura de entrada do usuário
  - Ex4-Part1/2/3.asm: Operações aritméticas

- **Projetos Completos**:
  - `calculadora.asm`: Calculadora com menu de operações
  - `Funcao-Quadrada.asm`: Avaliação de função quadrática
  - `Trabalho2.asm`: Identificação de números primos
  - `intervalo.asm` e `intervaloUnico.asm`: Manipulação de intervalos
  - `Impares.asm`: Verificação de números ímpares

## Requisitos

- **NASM** (Netwide Assembler)
- **ld** (GNU Linker)
- Sistema operacional Linux (x86-64)

---

Este repositório serve como registro do aprendizado e evolução durante a disciplina, demonstrando a progressão desde conceitos básicos até a implementação de programas mais complexos em linguagem de montagem.
