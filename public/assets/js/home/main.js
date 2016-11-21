	function carregarSlides() {
		$("#slide img:eq(0)").addClass("ativo").show();
		var texto = $(".ativo").attr("data-description");
		$("#slide").prepend("<span>"+texto+"</span>");
		$("#slide span").hide().html(texto).delay(500).fadeIn();

		setInterval(slide,4000);

		function slide(){

			if($(".ativo").next().size()){							
				$(".ativo").fadeOut().removeClass("ativo").next().fadeIn().addClass("ativo");
			}else{
				$(".ativo").fadeOut().removeClass("ativo");
				$("#slide img:eq(0)").fadeIn().addClass("ativo");
			}

			$('#slide span').remove();
			texto = $(".ativo").attr("data-description");
			$("#slide").prepend("<span>"+texto+"</span>");
		}
	}