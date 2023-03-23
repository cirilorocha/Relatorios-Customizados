# Relatorios-Customizados

Este gerador de relatórios permite de maneira simples e ágil a criação e manutenção de relatórios customizados utilizando uma simples tela de cadastro.

Todas as informações necessárias para montagem do relatório são preenchidas em campos e grids. As informações base do relatório são obtidas a partir de uma query informada dentro do cadastro, podendo utilizar os filtros das perguntas do relatório ou qualquer expressão ADVPL, pois, a mesma será interpretada.

A montagem dos campos é toda feita baseado no dicionário, e caso necessário pode ser utilizado comando ADVPL porque o campo também é interpretado. Nesta configuração é possível definir o tamanho, decimal, máscara, alinhamento e se este campo será totalizado no final do relatório e agrupamentos. Esse processamento dos totais é feito de nova nativa bastanto deixar a coluna **Totaliza** igual a Sim.

É possível determinar vários níveis de agrupamento dos dado do relatório, e cada nível possui de forma automática todos os totalizadores informados nos campos. A impressão do totalizador segue os mesmos parâmetros do campo relacionado, e caso necessário também pode ser modificado via expressão ADVPL (interpretado também).

Os acessos aos relatórios é feito via menu chamando uma consulta padrão com a lista dos relatórios disponíveis para aquele determinado menu do usuário, assim toda a configuração fica dinâmica e disponível para o usuário de forma imediata.

Toda a excução da query e das macros necessárias ao relatório é validada antes da gravação da estrutura, de forma a não gerar erros de tempo de execução. Todos os dados são devidamente verificados, desde a query, os campos e os agrupamentos. Isso dá muita segurança que quando o usuário for emitir o mesmo não ocorram erros.

A geração do relatório pode ser feita de várias formas:

* Relatório normal (p/ spool)
* Planilha Excel ou LibreOffice
* Arquivo PDF
* Email
* OU ainda chamado por algum job para gravação do PDF e posterior envio por email.

## Observações

* **Da forma que está atualmente talvez ainda precise de alguns retoques para funcione em qualquer ambiente, além do [CXLibCore](https://github.com/cirilorocha/CXLibCore)**

* **Os dicionários ainda serão disponibilizados para aplicação**

* **Talves ainda esteja faltando algum fonte necessário ao sei funcionamento**

## ## PENDÊNCIAS (TODO)

- [ ]  Arquivos de Dicionário
- [ ]  Converter CXPergunte para ParamBox
- [ ]  Converter o fonte principal de RptStatus para tReport
- [ ]  Converter a tela de cadastro para MVC