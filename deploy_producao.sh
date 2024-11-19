#!/bin/bash

# Constrói a imagem Docker para produção
docker build -t starbostaai/n8ntopy:latest .

# Faz o push da imagem para o repositório
docker push starbostaai/n8ntopy:latest


echo "Deploy de produção concluído."
