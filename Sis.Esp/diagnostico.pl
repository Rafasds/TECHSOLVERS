% Defeitos na memória
erros('Nao da imagem', 'Memoria suja').
erros('Nao da imagem', 'Memoria com defeito').
erros('Tela travou', 'Quantidade de memoria insuficiente').

% Defeitos no armazenamento
erros('Tela azul', 'Sistema operacional corrompido').
erros('Tela preta', 'SSD com defeito').
erros('Arquivos nao podem ser acessados', 'Sistema de arquivos corrompidos').
erros('Espaço insuficiente', 'Armazenamento cheio').

% Problemas com a Bios
erros('No boot device', 'Bios desconfigurada').

% Defeitos na placa mãe
erros('Nenhuma luz acende, mas a fonte de alimentaçao gira a ventoinha', 'Defeito na Placa mãe').
erros('Nao liga e ha ruidos', 'Placa mae em curto').
erros('USB com defeito', 'Perifericos nao reconhecidos').

% Defeitos na fonte de alimentação
erros('Computador nao liga e nao ha ruidos', 'Fonte de alimentaçao com defeito').
erros('Computador nao liga', 'Cabo de força desconectado').

% Defeitos no processador ou cooler
erros('Superaquecimento', 'Cooler inadequado para o processador').
erros('Superaquecimento', 'Trocar pasta termica').
erros('Ventoinha nao gira', 'Cooler com defeito').

% Defeitos na bateria CR2032
erros('A Bios nao salva as configuraçoes', 'Bateria CR2032 descarregada, necessario trocar').

% Problemas com software
erros('Sem som', 'Driver de audio desatualizado').
erros('Sem conexao', 'Wireless com defeito ou driver de rede desatualizado').
erros('Resoluçao distorcida', 'Driver de video desatualizado').
erros('Lentidao', 'Virus').
erros('Programa nao abre', 'Sistema operacional desatualizado').
erros('O windows update nao consegue baixar ou instalar atualizações', 'Sem internet').

% Problemas no vídeo
erros('Tela apagada', 'Cabos VGA ou HDMI soltos').
erros('Tela apagada', 'Monitor desligado').

% Problemas com software
erros('Sem som', 'Driver de áudio desatualizado').
erros('Sem conexão', 'Wireless com defeito ou driver de rede desatualizado').
erros('Resolução distorcida', 'Driver de vídeo desatualizado').
erros('Lentidão', 'Vírus').
erros('Programa não abre', 'Sistema operacional desatualizado').
erros('O windows update não consegue baixar ou instalar atualizações', 'Sem internet').
erros('Mouse mexendo sozinho', 'Vírus').


% Problemas no vídeo
erros('Tela apagada', 'Cabos VGA ou HDMI soltos').
erros('Tela apagada', 'Monitor desligado').

% Problemas na câmera
erros('Webcam não reconhecida', 'Driver não instalado ou desatualizado').

% Diagnóstico baseado no erro informado pelo usuário
diagnosticar_erro(Erro) :- 
    erros(_, Erro),
    write('Causa identificada: '), nl,
    listar_causa_erro(Erro).

listar_causa_erro(Erro) :- 
    erros(Categoria, Erro), 
    write(Categoria), nl.

listar_causa_erro(_) :- 
    nl, write('Fim da lista de causas de erros.').