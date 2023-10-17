import os

def e(key, default=None):
  res = os.getenv(key, default)

  if res is None:
    raise "Required env var \"{key}\" missing"

  return res


DB_HOST = e("DB_HOST")
DB_PASS = e("DB_PASS")
DB_USER = e("DB_USER")
DB_NAME = e("DB_NAME")


def forEnv(env):
  if env == "devel":
    return DevConfig
  if env == "production":
    return ProdConfig

  raise f"No environment for {env}"

# Note: Since this is ALWAYS run within a container, these paths can be entirely
# static.
class Config(object):
  SQLALCHEMY_DATABASE_URI = "sqlite://:memory:"
  SQLALCHEMY_TRACK_MODIFICATIONS = False
  STATIC_FOLDER = "/app/flaskapp/static"
  MEDIA_FOLDER = "/app/flaskapp/media"


class DevConfig(Config):
  SQLALCHEMY_DATABASE_URI = f"postgresql://{DB_USER}:{DB_PASS}@db:5432/{DB_NAME}"


class ProdConfig(Config):
  pass

