;
window.IDEA || (window.IDEA = {});    //namespace

IDEA.parseJSON = function(json) {
    var result = $.parseJSON(json);
    if(result.type == 'success') {
        return result;
    }else{
        alert(result);                    
    }
}