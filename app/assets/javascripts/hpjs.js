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
  addClickBtnListener(document.querySelector('.pick-btn'));
});

var addClickListener = function(clickable) {
  clickable.addEventListener('click', function(e) {
    if(this.classList.value.includes('highlighted')) {
      var marker = this.classList.remove('highlighted')
    }
    else {
      this.classList.add('highlighted')
    }
  });
}

var arrayAdd = function(targets){
  targets.forEach(function(target){
    addClickListener(target)
  })
}

var addClassListeners = function(e) {
  var tankIcon = document.querySelector('.tank-class');
  var specIcon = document.querySelector('.spec-class');
  var supIcon = document.querySelector('.sup-class');
  var assnIcon = document.querySelector('.assn-class');
  arrayAdd([tankIcon, specIcon, supIcon, assnIcon])
};

var addGameListeners = function(e) {
  var blizzIcon = document.querySelector('.game-blizz');
  var diabloIcon = document.querySelector('.game-diablo');
  var scIcon = document.querySelector('.game-sc');
  var wcIcon = document.querySelector('.game-wc');
  var owIcon = document.querySelector('.game-ow');
  arrayAdd([blizzIcon, diabloIcon, scIcon, wcIcon, owIcon])
};

var addClickBtnListener = function(clickable) {
  clickable.addEventListener('click', function(e) {
    var blizzIcon = document.querySelector('.game-blizz');
    var diabloIcon = document.querySelector('.game-diablo');
    var scIcon = document.querySelector('.game-sc');
    var wcIcon = document.querySelector('.game-wc');
    var owIcon = document.querySelector('.game-ow');
    var tankIcon = document.querySelector('.tank-class');
    var specIcon = document.querySelector('.spec-class');
    var supIcon = document.querySelector('.sup-class');
    var assnIcon = document.querySelector('.assn-class');
    var mapHighlighted = buildObject([tankIcon, specIcon, supIcon, assnIcon, blizzIcon, diabloIcon, scIcon, wcIcon, owIcon]);
    
  });
}

var buildObject = function(targets) {
  var mh = targets.map(target => {
    var hObj = {};
    hObj[target.classList[0]] = target.classList.value.includes('highlighted')
    hObj["hidden"] = !hObj[target.classList[0]]
    return hObj
  });
  console.log(mh)
  return mh
}