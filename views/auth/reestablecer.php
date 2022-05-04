<div class="contenedor reestablecer ">
    <?php include_once __DIR__.'/../templates/nombre-sitio.php'; ?>

    <div class="contenedor-sm">
        <p class="descripcion-pagina">Coloca tu nueva Contraseña</p>

        <?php include_once __DIR__.'/../templates/alertas.php'; ?>

        <?php if($mostrar){?>

        <form class="formulario" method="POST" >
            
            <div class="campo">
                <label for="password">Contraseña</label>
                <input 
                    type="password"
                    id="password"
                    placeholder="Tu Contraseña"
                    name="password"
                />
            </div>


            <input type="submit" class="boton" value="Guardar Contraseña">
        </form>

        <?php }?>

        <div class="acciones">
            <a href="/crear">¿No tienes una cuenta? Crear Cuenta</a><br>
            <a href="/olvide">¿Olvidaste tu contraseña?</a>
        </div>
    </div><!-- Contenedor-sm -->
</div>