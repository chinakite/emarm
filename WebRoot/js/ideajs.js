;
window.IDEA || (window.IDEA = {});    //namespace

IDEA.parseJSON = function(json) {
    var result = $.parseJSON(json);
    return result;
    /*
    if(result.type == 'success') {
        return result;
    }else{
        alert(result);                    
    }
    */
}