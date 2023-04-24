# escolher a imagem base do container
FROM ubuntu:22.04

# sinalizando a aplicação que deve estar fazendo o download de py3 e do pip o gerenciador de arquivo do python
RUN apt-get update && apt-get install -y python3 python3-pip
# esta segunda run, é necessario que o pip esteja instalado para que faça a instalação do framework flask
RUN pip install flask==2.1.*

#faz a copia do arquivo "hello.py" arquivo do contexto de construção para o diretório raiz 
COPY hello.py /

#define a variavel de ambinete linux, essa variavel flask vai estar executando o arquivo hello.py dentro da imagem  
ENV FLASK_APP=hello 

# faz o mapeamento de porta
EXPOSE 8000

#comando que vai ser executado quando o usario fizer a inicialização do container
CMD flask run --host 0.0.0.0 --port 8000