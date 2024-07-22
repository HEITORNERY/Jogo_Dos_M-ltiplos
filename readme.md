# Readme
Esse repositório contém tudo que foi usado para realizar o jogo: Caminho dos Multiplos. Esse projeto foi um desafio que recebi para fazer em dois dias. Nesse projeto aprendi a criar um sistema de login e registro, geração de caminho aleatório e registrar data e hora de entrada dentro de um evento do jogo, além de trabalhar com a criação de plataformas móveis e a incorporação de elementos interativos no mundo de plataforma.
# Clonando este repositório
Caso tenha interesse em baixar esse projeto, basta no terminal colocar o comando abaixo:
```bash
git clone https://github.com/HEITORNERY/Jogo_Dos_M-ltiplos.git
```
# Sistema de Registro de Usuário
Quando entrar no jogo não terá nenhum usuário salvo, por isso deve se registrar. O registro é feito com seu CPF e uma senha de até 8 caracteres.

![registro](https://github.com/user-attachments/assets/b3d0c99c-2702-489d-b8f1-d58a042c662d)
# Sistema de Login
Quando o registro for feito, basta ir para a cena de login, onde vai colocar seu usuário e sua senha cadastrado no passo anterior.

![login](https://github.com/user-attachments/assets/80d1451d-488a-4f84-8847-e425e1672237)
# Mundo 2D
O jogo inteiro passa-se num ambiente de plataforma 2D, onde vai ter um item que deve ser coletado para desbloquear um item oculto, que ao ser clicado com o mouse leva para um desafio.

![mundo_2d](https://github.com/user-attachments/assets/2ec2dca6-c77f-4a73-bab7-57e66e944720)
# Desafio do caminho aleatório
O caminho é gerado aleatoriamente, o caminho é gerado por um número base, que vai de 2 a 10, e os outros números são múltiplos desse número. Cada vez que entrar nesse desafio, os números serão aleatórios e sua posição também.

![caminho_aleatorio](https://github.com/user-attachments/assets/c1751506-f70d-4670-84e4-5545f09f3d39)

Basta apertar num número que o personagem irá até ele, mas se clicar num local onde não tem número, então será fim de jogo.
O desafio será finalizado quando for clicando nos números na ordem até o último.
# Tela Final do Desafio
Se perder o desafio ou finalizar será levado para uma tela onde vai ter a opção de tentar novamente ou voltar pro mundo. Lá também vai ter a data e a hora que entrou no desfio e a hora que terminou ou a hora que perdeu o desafio.

![save_data_and_time](https://github.com/user-attachments/assets/0e6001ab-bea5-40d6-9625-d13ad91a1ae1)
# Demonstração do Jogo
Aqui terá um vídeo para ver o jogo desenvolvido.
https://github.com/user-attachments/assets/2f01f7d2-8501-4bb5-b92d-251fba105b6b
# Link para jogar o jogo
(https://heitornery.itch.io/caminho-dos-multiplos)
