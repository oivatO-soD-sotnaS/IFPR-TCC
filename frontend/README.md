# /etc/hosts
O arquivo de variáveis de ambiente possui as URLs da API do backend e do servidor de arquivos, também no backend. No entanto, como o container do backend é local, precisamos, de forma manual, instruir o computador de como resolver o domínio. Execute o comando abaixo:
```shell
echo "127.0.0.1 api.intellecta files.intellecta" | sudo tee -a /etc/hosts
```

# Instalando novas dependências
Para instalar novos pacotes no projeto, execute o comando abaixo:
```bash
sudo docker compose exec frontend_container npm install algum-pacote
```
Isso é necessário pois o bind volume do frontend não inclui a pasta node_modules. Dessa forma, caso se instale uma nova dependência localmente, ela também precisa ser instalada dentro do container.
> Não fazer isso irá quebrar o funcionamento do container, uma vez que ele não possui as novas depências do projeto.