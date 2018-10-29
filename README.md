# Codando Juntas iOS-APP


O Aplicativo vai servir como um Hub para Adicionar e consultar todo o material produzido neste repositório. 
(por enquanto este é o objetivo, mas podemos adicionar mais features)

## Arquitetura

Para o Codando Juntas, decidimos sair um pouco da zona de conforto do tradicional **MVC** e estamos construindo o App em **MVVM** e usando **RXSwift**
Cada view é independente e se comporta como um módulo, com seu próprio **_.xib_**, **_view_** e **_view model_**.

Toda a navegação é gerenciada por um **coordinator**. Ele remove a responsabilidade da lógica de navegação das Views e concentra tudo em um só lugar. Isto vai facilitar muito o trabalho de adicionar ou remover fluxos de navegação.





