module Web.Component.Test where

import IHP.ViewPrelude
import IHP.ServerSideComponent.Types
import IHP.ServerSideComponent.ControllerFunctions

data Test = Test {
    errorMessage :: Maybe Text
} deriving (Eq, Show)

data TestController 
    = ErrorAction { message :: !Text }
    deriving (Eq, Show, Data)

$(deriveSSC ''TestController)

instance Component Test TestController where
    initialState = Test {
        errorMessage = Nothing
    }

    render Test { errorMessage } = [hsx|
        <div class="mb-3">
            <label class="form-label">Any Input</label>
            <input type="text"
                class={classes [("form-control", True), ("is-invalid", isJust errorMessage)]}
                onkeyup="callServerAction('ErrorAction',{message: 'error'})">
            <div class="invalid-feedback">{errorMessage}</div>
        </div>
    |]
                   
    action state ErrorAction { message }= do
        pure state { errorMessage = Just "An Error" }
        
