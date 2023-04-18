$(() => {
    $("body").hide()

    function adicionarElementos(tabelaArray, imagens) {
        for (var i = 0; i < tabelaArray.length; i++) {
            $('.scroll').append(`<div class="container-armas">
                                    <img src = "${imagens}/${tabelaArray[i].index}.png" alt = "" width = "200px", height = "75px" >
                                    <div class="contaienr-equipar">
                                    <h3>${tabelaArray[i].nome}</h3>
                                        <button id="btn-equipar" class="${tabelaArray[i].index}">EQUIPAR</button>
                                    </div>
                                </div >`)
        }
    }

    window.addEventListener("message", function (event) {
        let status = event.data.action
        switch (status) {
            case "show":
                var tabelaArray = JSON.parse(event.data.arma);
                adicionarElementos(tabelaArray, event.data.imagem)
                $("body").show()
                break;
            case "hide":
                $('.scroll').empty();
                $("body").hide()
                break;
            default:
        }
    })

    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape' || event.keyCode === 27) {
            $("body").hide()
            $('.scroll').empty();
            $.post("http://conti_arsenal/focusFalse")
        }
    });

    $(".scroll").on("click", "#btn-equipar", function() {
        var armaClasse = $(this).attr("class");
        $.post("http://conti_arsenal/botao-armas", JSON.stringify({ arma: armaClasse}))
    });

    $(".btn-kit").click( function () {
        $.post("http://conti_arsenal/botao-kit")
    })

    $(".btn-remover").click( function () {
        $.post("http://conti_arsenal/botao-remover")
    })

    $(".btn-colete").click(function () {
        $.post("http://conti_arsenal/botao-colete")
    })

})