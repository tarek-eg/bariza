## Start the Internet Computer network on your local computer

```
dfx start
```

## Register unique canister identifiers for the canisters in the project

```
dfx canister create --all
```

## Build the executable canister
```
dfx build
```

## Deploy
```
dfx canister install --all
```

## Run the dfx canister call
```
dfx canister call explore_hello greet everyone
```