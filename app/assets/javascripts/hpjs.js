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
  addPickButtonListener(document.querySelector('.pick-btn'));
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
      <td class="${hero["h_name"]} ${hero["h_game"]} ${hero["h_class"]}"> 
        <input type="checkbox" checked>
      </td>
    `)
  }
  if (begEnd[1]){$(table).append('</tr>')}
}

var buildTable = function(e) {
  return $.ajax({
    url: API + '/api/v1/heroes',
    method: 'GET',
  }).done(function(data) {
    var table = ('.full-metal')
      for(var i = 0;i < (data.length); i += 8) {
        for(var k = 0; k < 8; k++) {
          beg = false; end = false
          if(k === 0){beg = true}
          if(k === 0){end = true}
          appendHeroToTable(table, data[i + k], [beg, end])
        }
      }
  }).fail(function(data) {
    handleError();
  })
}

var mapIcons = function(clickable) {
  return buildObject(buildMap());
}

var buildMap = function(e) {
  var blizzIcon = document.querySelector('.Blizzard');
  var diabloIcon = document.querySelector('.Diablo');
  var scIcon = document.querySelector('.StarCraft');
  var wcIcon = document.querySelector('.Warcraft');
  var owIcon = document.querySelector('.Overwatch');
  var tankIcon = document.querySelector('.Warrior');
  var specIcon = document.querySelector('.Specialist');
  var supIcon = document.querySelector('.Support');
  var assnIcon = document.querySelector('.Assassin');
  return [tankIcon, specIcon, supIcon, assnIcon, blizzIcon, diabloIcon, scIcon, wcIcon, owIcon]
}

var addPickButtonListener = function(clickable){
  clickable.addEventListener('click', function(e) {
    var tF  = mapIcons
    return $.ajax({
      url: API + '/api/v1/heroes',
      method: 'GET',
      dataType: "json",
      data: "json=" + escape(JSON.stringify(tF)),
      processData: false,
    }).done(function(data) {
      console.log(data)
    }).fail(function(data) {
      handleError();
    })
  })
}

var eachVar = function(mapIcons){
  var mi = mapIcons.map(value => {
    console.log(value)
  })
}

var trueFalse = function(heroMap) {
  var map = heroMap.map(value => {
    value["hidden"]
  })
  return map
}

var buildObject = function(targets) {
  var mh = targets.forEach(target => {
    var hObj = "";
    if(target.classList.value.includes('highlighted')){
      hObj.push('y')
    }
    else{
      hObj.push('n')
    }
  });
  return mh
}