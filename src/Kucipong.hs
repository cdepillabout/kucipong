
module Kucipong ( defaultMain ) where

import Kucipong.Prelude

import Database.Persist.Sql ( runSqlPool )

import Kucipong.Config ( Config(..), createConfigFromEnv )
import Kucipong.Db ( doMigrations )
import Kucipong.Handler ( app )

-- | Run the API.
defaultMain :: IO ()
defaultMain = do
    config <- createConfigFromEnv
    -- TODO: Probably shouldn't run migrations in production automatically.
    runSqlPool doMigrations $ configPool config
    app config
