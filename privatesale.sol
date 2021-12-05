pragma solidity ^0.8.7;
// SPDX-License-Identifier: Unlicensed
interface IERC20 {

    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);
    

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    function name() external view returns (string memory);
    //returns token name
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}



/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}



contract PrivateSale {

    using SafeMath for uint256;
    using Address for address; 

    IERC20 public _token;
    IERC20 public _BUSD;
    
    address owner;
    
    mapping (address=>bool) public _enteredPrivateSale;
    mapping (address=>uint256) public _contribution;
    mapping (address=>uint256) public _whitelisted;
    
    bool public finished=false;
    bool public started=false;
    bool public claimable=false;
    bool public tokenAddressSet=false;
    bool public cancelPS=false;
    
    uint256 public BUSDperToken=25*10**17;
    uint256 public maxCon=1250*10**18;
    uint256 public minCon=250*10**18;
    uint256 private tokensrequired=0;
    uint256 public hardCap=35000*10**18;
    uint256 public collected=0;
    
    event EnteredSale(address participant, uint256 BUSD, uint256 tokensToReceive);
    event Started();
    event Finished();
    event ClaimStarted(uint256 tokensRequired);
    event Claimed(address participant,uint256 tokensReceived);
    event BUSDAddressChanged(address newAddress);
    event TokenAdressChange(address newAddress);
    event Whitelist(address participant, uint256 BUSD);
    event RefundStarted();
    event Refunded(uint256 BUSD);
    
    modifier onlyOwner() {
        require(msg.sender == owner,"NOT OWNER");
        _;
    }
      
    constructor (address token) {
        owner=msg.sender;
        _BUSD=IERC20(token);
    }
    
    
    function whitelist(address participant, uint256 BUSD) public onlyOwner(){
        _contribution[participant]=_contribution[participant].add(BUSD);
        tokensrequired=tokensrequired.add(BUSD.mul(10**18).div(BUSDperToken));
        _whitelisted[participant]=_whitelisted[participant].add(BUSD.mul(10**18).div(BUSDperToken));
        emit Whitelist(participant,BUSD);
    }

      
    function TokenAddressSet(address token) public onlyOwner(){
        _token=IERC20(token);
        tokenAddressSet=true;
        emit TokenAdressChange(token);
    }
    
    function BUSDAddressSet(address token) public onlyOwner(){
        _BUSD=IERC20(token);
        emit BUSDAddressChanged(token);
    }
    
    function startPrivateSale() public onlyOwner(){
        require(!started,"already started");
        started=true;
        emit Started();
    }
    
    function enterPrivateSale(uint256 BUSD) public {
        require(started&&!finished ,"the Private Sale finished or hasn't started");
        require(!_enteredPrivateSale[msg.sender],"Already participated in Private Sale");
        require(_contribution[msg.sender].add(BUSD)<=maxCon,"Max contribution reached");
        require(BUSD>=minCon,"Min contribution not reached");
        require(_BUSD.allowance(msg.sender,address(this))>=BUSD,"not approved");
        require(BUSD.add(collected)<=hardCap,"hardCap exceeded");
        _BUSD.transferFrom(msg.sender,address(this),BUSD);
        _enteredPrivateSale[msg.sender]=true;
        _contribution[msg.sender]=_contribution[msg.sender].add(BUSD);
        tokensrequired=tokensrequired.add(BUSD.mul(10**18).div(BUSDperToken));
        collected=collected.add(BUSD);
        emit EnteredSale(msg.sender,BUSD,tokenToReceive(msg.sender));
    }

    function tokenToReceive(address participant) public view returns(uint256){
        return(_contribution[participant].div(BUSDperToken).mul(10**18));
    }

    function finishPrivateSale() public onlyOwner(){
        require(started,"private sale hasn't started yet");
        finished=true;
        emit Finished();
    }
    
    function startClaim() public onlyOwner(){
        require(finished,"private sale hasn't finished yet");
        require(tokenAddressSet,"token address not set");
        claimable=true;
        _token.transferFrom(msg.sender,address(this),tokensrequired);
        emit ClaimStarted(tokensrequired);
    }

    function Claim() public {
        require(claimable,"claim has not started");
        require(_enteredPrivateSale[msg.sender],"didn't participate or already claimed");
        require(_token.balanceOf(address(this))>=tokenToReceive(msg.sender),"not enough tokens, please contact support");
        _token.approve(msg.sender,tokenToReceive(msg.sender));
        _token.transfer(msg.sender,tokenToReceive(msg.sender));
        _enteredPrivateSale[msg.sender]=false;
        emit Claimed(msg.sender,tokenToReceive(msg.sender));
    }
    
    
    function balanceOfcontract() public view returns(uint256) {
        return (collected);
    }

    function getFunds() public onlyOwner(){
        require(_BUSD.balanceOf(address(this))>0,"nothing to collect");
        _BUSD.approve(owner,_BUSD.balanceOf(address(this)));
        _BUSD.transfer(owner,_BUSD.balanceOf(address(this)));
    }

    function StartRefund() public onlyOwner(){
        require(finished,"private sale has not finished");
        cancelPS=true;
        claimable=false;
        emit RefundStarted();
    }
    
    function Refund() public{
        require(cancelPS, "private sale is not canceled");
        require(_enteredPrivateSale[msg.sender],"nothing to refund or already refunded");
        _enteredPrivateSale[msg.sender]=false;
        _BUSD.approve(msg.sender,_contribution[msg.sender].sub(_whitelisted[msg.sender]));
        _BUSD.transfer(msg.sender,_contribution[msg.sender].sub(_whitelisted[msg.sender]));
        emit Refunded(_contribution[msg.sender].sub(_whitelisted[msg.sender]));
    }

    fallback () external {
        revert("Not Accepting BNB");
    }
    
}
