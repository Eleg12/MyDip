// Плагин для проверки телефон

$(document).ready(function() {
  $("#number-user-call").inputmask("+7(999)999-99-99");
});

// Открытие модалок

$(".block-information__button").click(function() {
  $(".modal-call").show();
});

$(".our-client__feedback-button").click(function() {
  $(".modal-callback").show();
});

$(".block-catalog__price-button").click(function() {
  $(".modal-call").show();
});

$(".block-polyplast__price-button").click(function() {
  $(".modal-call").show();
});

$(".block-pongs-textil__price-button").click(function() {
  $(".modal-call").show();
});

// Закрытие модалок

$(".callback-close").click(function() {
  $(".modal-call").hide();
});

$(".callbacks-close").click(function() {
  $(".modal-callback").hide();
});

$(".callback-close-okey").click(function() {
  $(".modal-okey").hide();
});

// Отправка запросов на сервер
// №1 Отправка заявки на звонок

$(".block-call__form-button").click(function() {
  event.preventDefault();

  let name = $("#name-user-call").val();
  let number = $("#number-user-call").val();

  if (name == "" || number == "") {
    return;
  }

  $.ajax({
    url: "php/callback.php",
    method: "POST",
    data: {
      number: number,
      name: name
    }
  });

  $(".modal-call").hide();
  $(".modal-okey").show();
});

// №2 Отправка отзыва

$(".block-callback__form-button").click(function() {
  event.preventDefault();

  let text = $("#text-user-feed").val();
  let name = $("#name-user-feed").val();
  let number = $("#number-user-feed").val();

  if (text == "" || name == "" || number == "") {
    return;
  }

  $.ajax({
    url: "php/feedback.php",
    method: "POST",
    data: {
      text: text,
      name: name,
      number: number
    }
  });

  $(".modal-okey").show();
});

// №3 Отравка запроса на замер

$(".gager-callback__form-button").click(function() {
  event.preventDefault();

  let date = $("#date-user-call").val();
  let time = $("#time-user-call").val();
  let address = $("#address-user-call").val();
  let wishes = $("#wishes-user-call").val();
  let name = $("#name-user-call").val();
  let number = $("#number-user-call").val();

  if (
    date == "" ||
    time == "" ||
    address == "" ||
    wishes == "" ||
    name == "" ||
    number == ""
  ) {
    return;
  }

  $.ajax({
    url: "php/measurement.php",
    method: "POST",
    data: {
      date: date,
      time: time,
      address: address,
      wishes: wishes,
      name: name,
      number: number
    }
  });

  $(".modal-okey").show();
});

$(".block-catalog__button").click(function() {
  let id = $(this).data("id");
  let button = $(`.block-catalog__buttons button[data-id="${id}"]`);

  button
    .addClass("block-catalog__button-active")
    .siblings()
    .removeClass("block-catalog__button-active");

  $(".block-catalog__information-title").text(button.data("title"));
  $(".block-catalog__information-about").text(button.data("text"));
  $(".block-catalog__information-area").text("Площадь: " + button.data("size"));
  $(".price-number").text(button.data("price"));
});

// Данные контактов

$.ajax({
  url: "php/contact.php",
  method: "GET",
  dataType: "json",
  success: function(data) {
    let address, time, phone, email;

    address = data[0]["address"];
    time = data[0]["time"];
    phone = data[0]["phone"];
    email = data[0]["email"];

    $("#textAddress").text(address);
    $("#textTime").text(time);
    $("#textPhone").text(phone);
    $("#textMail").text(email);
    $("#textAddress2").text(address);
    $("#textTime2").text(time);
  }
});

// Переход на страницу, которую выбрал пользователь

$(".block-catalog__photo-block").click(function() {
  let id = $(this).data("id");
  let good = $(`.block-catalog__photo-block[data-id="${id}"]`);

  document.location.href = good.data("url");
});
