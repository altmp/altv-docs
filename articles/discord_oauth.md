# Introduction

The Discord OAuth (Open Authorization) is used to identify a user by the usage of a Discord account.
By using the built-in OAuth token request you'll receive a token which can be used to identify the user against the
Discord api.

> [!TIP]
> The returned data of the token validation can be found at the [Discord api documentation](https://discord.com/developers/docs/resources/user#user-object).

# Step-by-Step tutorial

## Preparation

Before you can use the OAuth token you need to create a Discord application.
<br>
To create a new application you need to:
- Open the [Discord Developer Portal](https://discord.com/developers/applications) and login with your discord account
- Click the "New Application" button on the top right
- Fill in your applications name and click on create
- Go to "OAuth2" and then "General"
- Click on "Add Redirect", enter `http://127.0.0.1` and click "Save Changes" in the bottom bar
- Copy the "CLIENT ID" on the top - it will be needed for the next step

## Client-side code

```js
// Enter the client id here
const DISCORD_APP_ID = '1234567890';

async function getOAuthToken() {
    try {
        const token = await alt.Discord.requestOAuth2Token(DISCORD_APP_ID);
        alt.emitServer('token', token);
    } catch (e) {
        // Error can be due invalid app id, discord server issues or the user denying access.
        alt.logError(e);
    }
}

getOAuthToken();
```

## Server-side code

```js
alt.onClient('token', async (player, token) => {
    // Validate the token with a GET request to the Discord api
    const request = await axios
        .get('https://discordapp.com/api/users/@me', {
            'headers': {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Authorization': `Bearer ${token}`
            }
        })
        .catch((err) => {
            return null;
        });

    // Check if the request was successful and if the neccessary properties are included
    if (!request || !request.data || !request.data.id || !request.data.username) {
        player.kick('Authorization failed');
        return;
    }

    // Example of returned properties
    alt.log(`Id: ${request.data.id}`);
    alt.log(`Name: ${request.data.username}#${request.data.discriminator}`);
});
```