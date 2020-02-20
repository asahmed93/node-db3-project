const db = require('../data/db-config');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
    addStep
}

function find(){
    return db.select("*")
    .from("schemes");
}

function findById(id){
    return db("schemes")
    .where({id})
    .first();
}

function findSteps(id){
    return db("steps")
    .join('schemes', 'schemes.id', 'steps.scheme_id')
    .select('schemes.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
    .where("scheme_id", id)
    .orderBy("steps.step_number");
}

function add(scheme) {
    return db("schemes")
    .insert(scheme);
  }
  
  function update(changes, id) {
    return db("schemes")
      .where({ id })
      .update(changes);
  }
  
  function remove(id) {
    return db("schemes")
      .where({ id })
      .del();
  }

  function addStep(step, id){
      return db("steps").insert({...step, scheme_id: id})
  }