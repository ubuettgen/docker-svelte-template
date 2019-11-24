<script>
	import 'bulma/css/bulma.css';
	export let name;
	import Button from 'svelma/src/components/Button.svelte';
	import Dialog from 'svelma/src/components/Dialog';
	import Toast from 'svelma/src/components/Toast'

  function prompt(opts) {
    Dialog.prompt({
      message: "What is your name?",
      ...opts
    })
    .then (prompt => {Toast.create(`Your answer was: '${prompt}'`), name = `${prompt}`})
  }

</script>

<style>
	h1 {
		color: purple;
	}
</style>

<h1>Hello {name}!</h1>
<h2>Start building your app from here. </h2><br>
<!-- Main container -->
<nav class="level">
  <!-- Left side -->
  <div class="level-left">
    <div class="level-item">
      <p class="subtitle">
        Please refer to <a href="https://svelte.dev/tutorial/basics">the Svelte tutorial</a>
      </p>
    </div>
    <div class="level-item">
        <p class="subtitle">
          and
        </p>
    </div>
    <div class="level-item">
    <p class="subtitle"><a href="https://c0bra.github.io/svelma">the Svelma docs</a></p>
    </div>
    <div class="level-item">
    <p class="subtitle">for further info.</p>
    </div>
   </div>
</nav>
<nav class="level">
    <div class="level-left">
        <div class="level-item">
            <Button type="is-primary" on:click={() => prompt()}>Click here to say hello!</Button>
        </div>
    </div>
</nav>
	<p>
	<strong> Good luck!</strong>
	</p>
