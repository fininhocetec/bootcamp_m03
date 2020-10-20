Aula prática Bootcamp IGTI - Módulo 3
======================================

IaC - Infra as Code

(Terraform, Ansible, aws cli + boto3 e python3)

 Infraestrutura como código para subir todo o ambiente na AWS para a prática do modulo 3.

A única modificação e ação necessária é a criação/importação do par de chaves para acesso SSH, e alterar no arquivo main.tf na seção key_name, o restante o código se encarrega de fazer, depois só acessar o IP publico da maquina da aplicação "telemetria1" na porta 8080. Na sessão extra tem um programa feito em python que lista os recursos criados inclusive lista por maquina/ip_publico.


Requisitos
------------

Instalação dos seguintes itens:

- Aws cli; (configurar as informações de acesso e região)

    - $ aws config

    ou

    O arquivo de configuração da AWS CLI, cujo padrão é ~/.aws/config, tem o seguinte formato:

            [default]
            region = us-east-2
            output = json

    O arquivo de configuração da AWS CLI, cujo padrão é ~/.aws/credentials, tem o seguinte formato:

            [default]
            aws_access_key_id = XYZXYZ
            aws_secret_access_key = XYZXYZ

- Terraform;

- Ansible; ( Instalação no Ubuntu ) 

    $ sudo apt install ansible

- Python3

    $ sudo apt install python3

- Pip ou pip3;

    $ sudo apt install python3-pip

Ter uma Key_name para acesso via SSH nas instancias de ec2;

Dependencies
------------

Modulo da AWS chamado boto e boto3;

    - Instalar com o seguinte comando;

       $ pip3 install boto3 (Em linux - ubuntu)

       c:\pip install boto3 (Em windows)


Subindo e destruindo o Ambiente
--------------------------------

Tenha certeza de estar na pasta onde se encontra o projeto. 

Subindo o ambiente:

    $ terraform init

    $ terraform plan
 
    $ terraform apply -auto-approve

Aguarde por um tempo a criação do ambinte. (Cerca de 1:30 min.)
 
    $ ansible-playbook -u ubuntu -i ec2.py site.yml


Destruindo o ambiente "para não correr o risco de ser cobrado :)" 

    $ terraform destroy -auto-approve


Extras
--------

Para listar os recuros criados:

    $ ./ec2.py --list

Será listado como item principal os IPs públicos para acesso via SSH ou HTTP.

Caso queira alterar o que o comando ec2.py trás, entre no arquivo ec2.ini e descomente as opções desejáveis.

Obs.: caso o programa em python3 ec2.py não estiver como executavél, basta rodar o seguinte comando:

    $ chmod +x ec2.py

Author Information
------------------

- Willdimark Ragazzi Ventura (<fininho.cetec@gmail.com>)
