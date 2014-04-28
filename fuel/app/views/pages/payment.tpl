{extends file="../template.tpl"}
{block name="content"}
	<h2>Payment</h2>
	<hr />
	<form method="POST">
		<div class="row">
			<div class="large-6 columns">
				<fieldset>
					<legend>Delivery Address</legend>
					<label for="name">Full Name *</label>
					<input type="text" name="name" id="name" value="{if Input::post('name')}{Input::post('name')}{/if}">
					<label for="address_1">Address Line 1 *</label>
					<input type="text" name="address_1" id="address_1" value="{if Input::post('address_1')}{Input::post('address_1')}{/if}">
					<label for="address_2">Address Line 2</label>
					<input type="text" name="address_2" id="address_2" value="{if Input::post('address_2')}{Input::post('address_2')}{/if}">
					<label for="postcode">Postcode *</label>
					<input type="text" name="postcode" id="postcode" value="{if Input::post('postcode')}{Input::post('postcode')}{/if}">
					<label for="city">Town/City *</label>
					<input type="text" name="city" id="city" value="{if Input::post('city')}{Input::post('city')}{/if}">
					<label for="county">County</label>
					<input type="text" name="county" id="county" value="{if Input::post('county')}{Input::post('county')}{/if}">
				</fieldset>
			</div>
			<div class="large-6 columns">
				<fieldset>
					<legend>Payment Details</legend>
					<label for="card_number">Card Number *</label>
					<input type="text" name="card_number" id="card_number" value="{if Input::post('card_number')}{Input::post('card_number')}{/if}">
					<label for="card_type">Card Type *</label>
					<select name="card_type" id="card_type">
						<option value="1" {if Input::post('card_type')==1}selected{/if}>Visa</option>
						<option value="2" {if Input::post('card_type')==2}selected{/if}>Maestro</option>
						<option value="3" {if Input::post('card_type')==3}selected{/if}>Delta</option>
						<option value="4" {if Input::post('card_type')==4}selected{/if}>MasterCard</option>
						<option value="5" {if Input::post('card_type')==5}selected{/if}>Electron</option>
						<option value="6" {if Input::post('card_type')==6}selected{/if}>Solo</option>
					</select>
					<label>Expiry Date *</label>
					<div class="row">
						<div class="large-6 columns">
							<select name="card_expiry_1" id="card_expiry_1">
								<option>Month</option>
								<option value="1" {if Input::post('card_expiry_1')==1}selected{/if}>1</option>
								<option value="2" {if Input::post('card_expiry_1')==2}selected{/if}>2</option>
								<option value="3" {if Input::post('card_expiry_1')==3}selected{/if}>3</option>
								<option value="4" {if Input::post('card_expiry_1')==4}selected{/if}>4</option>
								<option value="5" {if Input::post('card_expiry_1')==5}selected{/if}>5</option>
								<option value="6" {if Input::post('card_expiry_1')==6}selected{/if}>6</option>
								<option value="7" {if Input::post('card_expiry_1')==7}selected{/if}>7</option>
								<option value="8" {if Input::post('card_expiry_1')==8}selected{/if}>8</option>
								<option value="9" {if Input::post('card_expiry_1')==9}selected{/if}>9</option>
								<option value="10" {if Input::post('card_expiry_1')==10}selected{/if}>10</option>
								<option value="11" {if Input::post('card_expiry_1')==11}selected{/if}>11</option>
								<option value="12" {if Input::post('card_expiry_1')==12}selected{/if}>12</option>
							</select>
						</div>
						<div class="large-6 columns">
							<select name="card_expiry_2" id="card_expiry_2">
								<option>Year</option>
								<option value="14" {if Input::post('card_expiry_2')==14}selected{/if}>14</option>
								<option value="15" {if Input::post('card_expiry_2')==15}selected{/if}>15</option>
								<option value="16" {if Input::post('card_expiry_2')==16}selected{/if}>16</option>
								<option value="17" {if Input::post('card_expiry_2')==17}selected{/if}>17</option>
								<option value="18" {if Input::post('card_expiry_2')==18}selected{/if}>18</option>
								<option value="19" {if Input::post('card_expiry_2')==19}selected{/if}>19</option>
								<option value="20" {if Input::post('card_expiry_2')==20}selected{/if}>20</option>
								<option value="21" {if Input::post('card_expiry_2')==21}selected{/if}>21</option>
								<option value="22" {if Input::post('card_expiry_2')==22}selected{/if}>22</option>
								<option value="23" {if Input::post('card_expiry_2')==23}selected{/if}>23</option>
								<option value="24" {if Input::post('card_expiry_2')==24}selected{/if}>24</option>
								<option value="25" {if Input::post('card_expiry_2')==25}selected{/if}>25</option>
							</select>
						</div>
					</div>
					<label for="card_csv">Card CSV Number *</label>
					<input type="text" name="card_csv" id="card_csv" value="{if Input::post('card_csv')}{Input::post('card_csv')}{/if}">
				</fieldset>
			</div>
		</div>
		<div class="row">
			<div class="large-12 columns">
				{$totalPrice=0}
				{foreach from=$smarty.session.cart key=id item=line}
					{$product=Model_Product::find($id)}
					{$totalPrice=($totalPrice + ($line['qty'] * $product['price']))}
				{/foreach}
				<h1>Total Cost: £{$totalPrice|number_format:2}</h1>
				<small>* Required Field</small>
				<hr />
				<input type="submit" name="submit" value="Pay Now" class="button tiny" />
			</div>
		</div>
	</form>
{/block}