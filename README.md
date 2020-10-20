Aula prática Bootcamp IGTI - Módulo 3
======================================

IaC - Infra as Code
 Infraestrutura como código para subir todo o ambiente na AWS para a prática do modulo 3.

 A única modificação e ação é a criação/importação do par de chaves para acesso SSH, e alterar no arquivo main.tf na seção key_name.


Requisitos
------------

Instalação dos seguintes itens:

aws cli; (configurar as informações de acesso e região)

terraform;

ansible; (sudo apt install ansible)

python3

pip ou pip3;

Ter uma Key_name para acesso via SSH nas instancias de ec2;

Dependencies
------------

Modulo da AWS chamdo boto e boto3;

    - Instalar com o seguinte comando;

        pip3 install boto3 (Em linux)

        pip install boto3 (Em windows)


Rodando e destruindo o Ambiente
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

Caso queira alterar o que o comando ec2.py tras, entre no arquivo ec2.ini e descomente as opções desejáveis.


Author Information
------------------

- Willdimark Ragazzi Ventura (<fininho.cetec@gmail.com>)
