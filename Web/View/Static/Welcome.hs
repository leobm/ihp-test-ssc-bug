module Web.View.Static.Welcome where
import Web.View.Prelude
import IHP.ServerSideComponent.ViewFunctions
import Web.Component.Test

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <div class="container">
            {test}
        </div>
    |]
        where
            test = component @Test

        