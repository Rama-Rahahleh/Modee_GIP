/*!
  * Bootstrap v4.5.2 (https://getbootstrap.com/)
  * Copyright 2011-2020 The Bootstrap Authors (https://github.com/twbs/bootstrap/graphs/contributors)
  * Licensed under MIT (https://github.com/twbs/bootstrap/blob/main/LICENSE)
  */
jQuery('#faqAccordion').on('shown.bs.collapse', function () {
    jQuery('.show').closest('.card').addClass('card-expanded').removeClass('card-collapsed');
})
jQuery('#faqAccordion').on('hide.bs.collapse', function () {
    jQuery('.show').closest('.card').addClass('card-collapsed').removeClass('card-expanded');
})

jQuery('#accordion').on('shown.bs.collapse', function () {
    jQuery('.show').closest('.card').addClass('card-expanded').removeClass('card-collapsed');
    jQuery('.show').closest('.card').addClass('card-expanded').addClass('card-expanded');
})
jQuery('#accordion').on('hide.bs.collapse', function () {
    jQuery('.show').closest('.card').addClass('card-expanded').addClass('card-collapsed');
    jQuery('.show').closest('.card').addClass('card-collapsed').removeClass('card-expanded');
})