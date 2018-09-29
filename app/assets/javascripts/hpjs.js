var API = "http://localhost:3000"
'use strict'
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
  buildTable();
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
  var tankIcon = document.querySelector('.Warrior');
  var specIcon = document.querySelector('.Specialist');
  var supIcon = document.querySelector('.Support');
  var assnIcon = document.querySelector('.Assassin');
  arrayAdd([tankIcon, specIcon, supIcon, assnIcon])
};

var addGameListeners = function(e) {
  var blizzIcon = document.querySelector('.Blizzard');
  var diabloIcon = document.querySelector('.Diablo');
  var scIcon = document.querySelector('.StarCraft');
  var wcIcon = document.querySelector('.Warcraft');
  var owIcon = document.querySelector('.Overwatch');
  arrayAdd([blizzIcon, diabloIcon, scIcon, wcIcon, owIcon])
};

var appendHeroToTable = function(table, hero, begEnd) {
  if (begEnd[0]){$(table).append('<tr>')}
  if(hero){
    $(table).append(`
      <td>${hero["h_name"]}</td>
      <td class="${hero["h_name"]}"> 
        <input type="checkbox" checked>
      </td>
    `)
  }
  if (begEnd[1]){$(table).append('</tr>')}
}

var buildTable = function(e) {
  return $.ajax({
    url: API + '/api/v1/heroes' + "?" + trueFalse(addClickBtnListener()),
    method: 'GET',
  }).done(function(data) {
    var table = ('.full-metal')
      for(var i = 0;i < (data.length); i += 8) {
        appendHeroToTable(table, data[i], [true, false])
        appendHeroToTable(table, data[i + 1], [false, false])
        appendHeroToTable(table, data[i + 2], [false, false])
        appendHeroToTable(table, data[i + 3], [false, false])
        appendHeroToTable(table, data[i + 4], [false, false])
        appendHeroToTable(table, data[i + 5], [false, false])
        appendHeroToTable(table, data[i + 6], [false, false])
        appendHeroToTable(table, data[i + 7], [false, true])
      }
  }).fail(function(data) {
    handleError();
  })
}

var addClickBtnListener = function(clickable) {
  var blizzIcon = document.querySelector('.Blizzard');
  var diabloIcon = document.querySelector('.Diablo');
  var scIcon = document.querySelector('.StarCraft');
  var wcIcon = document.querySelector('.Warcraft');
  var owIcon = document.querySelector('.Overwatch');
  var tankIcon = document.querySelector('.Warrior');
  var specIcon = document.querySelector('.Specialist');
  var supIcon = document.querySelector('.Support');
  var assnIcon = document.querySelector('.Assassin');
  return mapHighlighted = buildObject([tankIcon, specIcon, supIcon, assnIcon, blizzIcon, diabloIcon, scIcon, wcIcon, owIcon]);
}

var trueFalse = function(heroMap) {
  var map = heroMap.map(value => {
    value["hidden"]
  })
  return map
}

var buildObject = function(targets) {
  var mh = targets.map(target => {
    var hObj = {};
    hObj[target.classList[0]] = target.classList.value.includes('highlighted')
    hObj["hidden"] = !hObj[target.classList[0]]
    return hObj
  });
  return mh
}