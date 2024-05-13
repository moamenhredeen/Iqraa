/// base repository that set unified names
/// for the method that should be implemented
/// in each concrete repository
/// [Type] the entity type
/// [ID] id type of the entity
abstract interface class AbstractRepository<Type, ID> {
  /// get all entities
  /// return list containing all entities
  Future<List<Type>> get();

  /// get all entities
  /// return list containing all entities
  Future<Type> getById(ID id);

  /// create new entity
  /// return the newly created entity
  Future<Type> create(Type entity);

  /// update existing entity
  /// return the updated entity
  Future<Type> update(Type entity);

  /// remove existing entity
  /// return the removed entity
  Future<Type> remove(ID id);
}
