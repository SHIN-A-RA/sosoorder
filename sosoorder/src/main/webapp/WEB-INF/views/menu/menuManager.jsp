<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
<!-- SLICK -->

.MultiCarousel {
	float: left;
	overflow: hidden;
	padding: 15px;
	width: 100%;
	position: relative;
}

.MultiCarousel .MultiCarousel-inner {
	transition: 1s ease all;
	float: left;
}

.MultiCarousel .MultiCarousel-inner .item {
	float: left;
}

.MultiCarousel .MultiCarousel-inner .item>div {
	text-align: center;
	padding: 10px;
	margin: 10px;
	background: #f1f1f1;
	color: #666;
}

.MultiCarousel .leftLst, .MultiCarousel .rightLst {
	position: absolute;
	border-radius: 50%;
	top: calc(50% - 20px);
}

.MultiCarousel .leftLst {
	left: 0;
}

.MultiCarousel .rightLst {
	right: 0;
}

.MultiCarousel .leftLst.over, .MultiCarousel .rightLst.over {
	pointer-events: none;
	background: #ccc;
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<!-- slick cdn -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script>
	//슬릭
	$(document)
			.ready(
					function() {
						var itemsMainDiv = ('.MultiCarousel');
						var itemsDiv = ('.MultiCarousel-inner');
						var itemWidth = "";

						$('.leftLst, .rightLst').click(function() {
							var condition = $(this).hasClass("leftLst");
							if (condition)
								click(0, this);
							else
								click(1, this)
						});

						ResCarouselSize();

						$(window).resize(function() {
							ResCarouselSize();
						});

						//this function define the size of the items
						function ResCarouselSize() {
							var incno = 0;
							var dataItems = ("data-items");
							var itemClass = ('.item');
							var id = 0;
							var btnParentSb = '';
							var itemsSplit = '';
							var sampwidth = $(itemsMainDiv).width();
							var bodyWidth = $('body').width();
							$(itemsDiv).each(
									function() {
										id = id + 1;
										var itemNumbers = $(this).find(
												itemClass).length;
										btnParentSb = $(this).parent().attr(
												dataItems);
										itemsSplit = btnParentSb.split(',');
										$(this).parent().attr("id",
												"MultiCarousel" + id);

										if (bodyWidth >= 1200) {
											incno = itemsSplit[3];
											itemWidth = sampwidth / incno;
										} else if (bodyWidth >= 992) {
											incno = itemsSplit[2];
											itemWidth = sampwidth / incno;
										} else if (bodyWidth >= 768) {
											incno = itemsSplit[1];
											itemWidth = sampwidth / incno;
										} else {
											incno = itemsSplit[0];
											itemWidth = sampwidth / incno;
										}
										$(this).css({
											'transform' : 'translateX(0px)',
											'width' : itemWidth * itemNumbers
										});
										$(this).find(itemClass).each(
												function() {
													$(this).outerWidth(
															itemWidth);
												});

										$(".leftLst").addClass("over");
										$(".rightLst").removeClass("over");

									});
						}

						//this function used to move the items
						function ResCarousel(e, el, s) {
							var leftBtn = ('.leftLst');
							var rightBtn = ('.rightLst');
							var translateXval = '';
							var divStyle = $(el + ' ' + itemsDiv).css(
									'transform');
							var values = divStyle.match(/-?[\d\.]+/g);
							var xds = Math.abs(values[4]);
							if (e == 0) {
								translateXval = parseInt(xds)
										- parseInt(itemWidth * s);
								$(el + ' ' + rightBtn).removeClass("over");

								if (translateXval <= itemWidth / 2) {
									translateXval = 0;
									$(el + ' ' + leftBtn).addClass("over");
								}
							} else if (e == 1) {
								var itemsCondition = $(el).find(itemsDiv)
										.width()
										- $(el).width();
								translateXval = parseInt(xds)
										+ parseInt(itemWidth * s);
								$(el + ' ' + leftBtn).removeClass("over");

								if (translateXval >= itemsCondition - itemWidth
										/ 2) {
									translateXval = itemsCondition;
									$(el + ' ' + rightBtn).addClass("over");
								}
							}
							$(el + ' ' + itemsDiv).css('transform',
									'translateX(' + -translateXval + 'px)');
						}

						//It is used to get some elements from btn
						function click(ell, ee) {
							var Parent = "#" + $(ee).parent().attr("id");
							var slide = $(Parent).attr("data-slide");
							ResCarousel(ell, Parent, slide);
						}

					});
</script>

<div class="container" align="center">
	<div class="row">
		<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1"
			id="MultiCarousel" data-interval="1000">
			<div class="MultiCarousel-inner">
				<div class="item">
					<div class="pad15">
						<p class="lead">1번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">2번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">3번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">4번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">5번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">6번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">7번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">8번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">9번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">10번 음식 종류</p>
					</div>
				</div>
				<div class="item">
					<div class="pad15">
						<p class="lead">11번 음식 종류</p>
					</div>
				</div>
			</div>
			<button class="btn btn-primary leftLst">왼쪽</button>
			<button class="btn btn-primary rightLst">오른쪽</button>
		</div>
	</div>
</div><br><br>
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">종류</th>
      <th scope="col">메뉴이름</th>
      <th scope="col">가격</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td></td>
      <td> </td>
      <td></td>
    </tr>
  </tbody>
</table>

<div align="right">
<button type="button" class="btn btn-danger" onClick="location.href='menuInsert'">등록</button>
</div>