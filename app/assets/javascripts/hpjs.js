function ready(callback){
    // in case the document is already rendered
    if (document.readyState!='loading') callback();
    // modern browsers
    else if (document.addEventListener) document.addEventListener('DOMContentLoaded', callback);
    // IE <= 8
    else document.attachEvent('onreadystatechange', function(){
        if (document.readyState=='complete') callback();
    });
}


ready(function(){
  addClassListeners();
  addGameListeners();
  
});

var addClickListener = function(clickable) {
  clickable.addEventListener('click', function(e) {
    this.class += ' highlighted'
  });
}

var addClassListeners = function(e) {
  var tankIcon = document.querySelector('.tank-class');
  addClickListener(tankIcon)
  var specIcon = document.querySelector('.spec-class');
  var supIcon = document.querySelector('.sup-class');
  var assnIcon = document.querySelector('.assn-class');
};

var addGameListeners = function(e) {
  var blizzIcon = document.querySelector('.game-blizz');
  var diabloIcon = document.querySelector('.game-diablo');
  var scIcon = document.querySelector('.game-sc');
  var wcIcon = document.querySelector('.game-wc');
  var owIcon = document.querySelector('.game-ow');
};