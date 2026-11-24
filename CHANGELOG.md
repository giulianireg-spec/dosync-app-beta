# Novedades · Changelog

## 0.4.0

- Más firme: si algo falla en una pantalla, la app no se cierra y "Reportar un problema" incluye qué falló (queda en tu teléfono hasta que lo mandas) · Sturdier: if something fails on a screen, the app doesn't close and "Report a problem" includes what failed (it stays on your phone until you send it).
- Un dato guardado dañado ya no te deja sin rutinas, y el servicio en segundo plano vuelve a intentar solo si no puede arrancar · A damaged saved entry no longer leaves you without routines, and the background service retries by itself if it can't start.

## 0.3.3 · hub 0.1.8

- Portones, puertas y alarmas conectados por un relé piden confirmación; cada aparato tiene "Pedir confirmación", "Es una luz" y "No apagar en grupo" · Gates, doors and alarms on a relay ask for confirmation; each device has "Ask for confirmation", "It's a light" and "Don't turn off with groups".
- Shelly y Tasmota con contraseña; aviso de los Smart Life sin cuenta; Hue avisa una lámpara sin luz · Shelly and Tasmota with a password; Smart Life devices without an account are reported; Hue reports a lamp without power.
- El hub: rutinas a la hora de tu casa con los nombres de hoy, más seguro, y el dueño se recupera con `dosync-hub dueño` · The hub: routines at your home's time with today's names, safer, and the owner can be recovered with `dosync-hub dueño`.

## 0.3.2 · hub 0.1.7

- Bloqueo opcional de la app (huella, rostro o PIN) y Ajustes en secciones · Optional app lock (fingerprint, face or PIN) and Settings in sections.
- El hub corre las rutinas solo, con dueños y miembros; rutinas más confiables · The hub runs routines by itself, with owners and members; more reliable routines.

## 0.3.1

- Un teléfono viejo como hub: pantalla apagada, app cerrada, y vuelve solo tras un reinicio · An old phone as your hub: screen off, app closed, and it comes back by itself after a restart.

## 0.3.0

- Hub DoSync opcional (Raspberry Pi o computadora vieja), con relevo cifrado para fuera de casa y actualizaciones firmadas · Optional DoSync hub (Raspberry Pi or old computer), with an encrypted relay for when you're away and signed updates.

## 0.2.1 a 0.2.9 · 0.2.1 to 0.2.9

- Detalle de cada una en [Releases](https://github.com/giulianireg-spec/dosync-app-beta/releases) · Details of each one in [Releases](https://github.com/giulianireg-spec/dosync-app-beta/releases).

## 0.2.0

- IA gratis en tu computadora con Ollama o LM Studio: sin clave, y las órdenes no salen de tu casa. La app la busca sola en el WiFi · Free AI on your own computer with Ollama or LM Studio: no key, and commands stay at home. The app finds it on your Wi-Fi.
- Diseño nuevo, de día y de noche, con el logo nuevo · New design for day and night, with the new logo.

## 0.1.0 — beta abierta · open beta

Primera versión pública. · First public version.

- Órdenes en 6 idiomas, sin IA y gratis · Commands in 6 languages, free, without AI.
- Asistente con IA opcional: busca en internet, encadena pasos, programa temporizadores y reglas · Optional AI assistant.
- Más de 80 marcas por WiFi, Bluetooth, infrarrojo o la cuenta de la marca · 80+ brands.
- Escenas y rutinas con la app cerrada · Scenes and routines with the app closed.
- Lo delicado (cerraduras, portones, hornos) espera tu confirmación · Sensitive actions wait for confirmation.
