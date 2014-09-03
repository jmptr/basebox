var conn = new Mongo();
var db = conn.getDB('admin');
var versionInfoDoc = {version: 1};

if (db.system.users.find({user: 'siteUserAdmin'}).count() === 0) {
  db.createUser({
    user: 'siteUserAdmin',
    pwd: 'letmein',
    roles: [{role: 'userAdminAnyDatabase', db: 'admin'}]
  });
}

db = conn.getDB('testing');
db.createCollection('dbInfo');
db.versionInfo.insert({version: 1});

if (!db.getUser('testingWriter')) {
  db.createUser({
    user: 'testingWriter',
    pwd: 'letmein',
    roles: [{role: 'readWrite', db: 'testing'}]
  });
}

db = conn.getDB('development');
db.createCollection('dbInfo');
db.versionInfo.insert({version: 1});

if (!db.getUser('developmentWriter')) {
  db.createUser({
    user: 'developmentWriter',
    pwd: 'letmein',
    roles: [{role: 'readWrite', db: 'development'}]
  });
}

db = conn.getDB('production');
db.createCollection('dbInfo');
db.versionInfo.insert({version: 1});

if (!db.getUser('productionWriter')) {
  db.createUser({
    user: 'productionWriter',
    pwd: 'letmein',
    roles: [{role: 'readWrite', db: 'production'}]
  });
}
