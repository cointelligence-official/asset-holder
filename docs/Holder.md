# Simple Token (Holder.sol)

View Source: [contracts/Holder.sol](../contracts/Holder.sol)

**↗ Extends: [Reclaimable](Reclaimable.md)**

**Holder**

Asset holder contract.

## Structs
### HoldingInfo

```js
struct HoldingInfo {
 uint256 amount,
 uint256 releaseDate
}
```

## Contract Members
**Constants & Variables**

```js
mapping(address => mapping(address => struct Holder.HoldingInfo)) internal _holdings;

```

## Functions

- [deposit(address token, uint256 releaseDate)](#deposit)
- [withdraw(address token, uint256 amount)](#withdraw)
- [tokenBalanceOf(address token, address account)](#tokenbalanceof)
- [lockedBalanceOf(address token, address account)](#lockedbalanceof)
- [releasableBalanceOf(address token, address account)](#releasablebalanceof)
- [releasableBalanceOf(struct Holder.HoldingInfo info)](#releasablebalanceof)
- [lockedBalanceOf(struct Holder.HoldingInfo info)](#lockedbalanceof)

### deposit

Deposit the tokens into this contract. Before using this function, you need to first approve this contract to receive the tokens.

```js
function deposit(address token, uint256 releaseDate) external nonpayable whenNotPaused 
returns(bool)
```

**Returns**

Returns true if the operation was successful.

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | address | The address of ERC20 token you want to deposit. | 
| releaseDate | uint256 | The timestamp in unix epoch when you want to be able to receive the funds back. | 

### withdraw

Withdraw your tokens from this contract.

```js
function withdraw(address token, uint256 amount) external nonpayable whenNotPaused 
returns(bool)
```

**Returns**

Returns true if the operation was successful.

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | address | The address of ERC20 token you want to withdraw. | 
| amount | uint256 | The amount you want to withdraw. | 

### tokenBalanceOf

Get the balance of the ERC20 contract for the specified account.

```js
function tokenBalanceOf(address token, address account) external view
returns(uint256)
```

**Returns**

Returns the balance of the ERC20 token held by the account.

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | address | Address of the ERC20 contract. | 
| account | address | The address of the account for which the balance is being requested. | 

### lockedBalanceOf

Get the locked balance of the ERC20 contract for the specified account.

```js
function lockedBalanceOf(address token, address account) external view
returns(uint256)
```

**Returns**

Returns the locked balance of the ERC20 token held by this account.

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | address | Address of the ERC20 contract. | 
| account | address | The address of the account for which the locked balance is being requested. | 

### releasableBalanceOf

Get the releasable balance of the ERC20 contract for the specified account.

```js
function releasableBalanceOf(address token, address account) external view
returns(uint256)
```

**Returns**

Returns the releasable balance of the ERC20 token held by this account.

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | address | Address of the ERC20 contract. | 
| account | address | The address of the account for which the releasable balance is being requested. | 

### releasableBalanceOf

```js
function releasableBalanceOf(struct Holder.HoldingInfo info) private view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| info | struct Holder.HoldingInfo |  | 

### lockedBalanceOf

```js
function lockedBalanceOf(struct Holder.HoldingInfo info) private view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| info | struct Holder.HoldingInfo |  | 

## Contracts

* [Address](Address.md)
* [CustomAdmin](CustomAdmin.md)
* [CustomOwnable](CustomOwnable.md)
* [CustomPausable](CustomPausable.md)
* [ERC20](ERC20.md)
* [ERC20Detailed](ERC20Detailed.md)
* [ForceEther](ForceEther.md)
* [Holder](Holder.md)
* [IERC20](IERC20.md)
* [Migrations](Migrations.md)
* [Ownable](Ownable.md)
* [Reclaimable](Reclaimable.md)
* [SafeERC20](SafeERC20.md)
* [SafeMath](SafeMath.md)
* [SimpleToken](SimpleToken.md)
