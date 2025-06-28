abstract class WTRepository<T> {

  Future<bool> insert(T? entity);

  Future<bool> update(T? entity);

  Future<bool> delete(T? entity);

  Future<bool> deleteAll();

  Future<T> getByKey(int? key);

  Future<List<T>> getAll();

}