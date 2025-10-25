<?php

use Flarum\Extend;
use Flarum\User\User;
use Flarum\User\Event\Saving;
use Flarum\User\Event\Registered;
use Flarum\Api\Serializer\UserSerializer;

return [
    // (new Extend\Frontend('forum'))
    //    ->js(__DIR__.'/js/dist/forum.js')
    //    ->css(__DIR__.'/resources/less/forum.less'),

    // Store as string on the model
    (new Extend\Model(User::class))
        ->cast('diabetes_type', 'string'),

    // Expose in API responses
    (new Extend\ApiSerializer(UserSerializer::class))
        ->attributes(function ($serializer, $model, array $attributes) {
            $attributes['diabetes_type'] = $model->diabetes_type ?? null;
            return $attributes;
        }),

    // Allow updating via PATCH /users
    (new Extend\Event())->listen(Saving::class, function (Saving $event) {
        $attrs = $event->data['attributes'] ?? $event->data ?? [];
        if (array_key_exists('diabetes_type', $attrs)) {
            $event->user->diabetes_type = trim((string) $attrs['diabetes_type']);
        }
    }),

    // Persist right after POST /register
    (new Extend\Event())->listen(Registered::class, function (Registered $event) {
        $attrs = [];

        // Newer cores: JSON:API attributes are here
        if (isset($event->data['attributes'])) {
            $attrs = $event->data['attributes'];
        }
        // Older cores: sometimes you can access the PSR-7 request
        elseif (property_exists($event, 'request') && $event->request) {
            $body  = $event->request->getParsedBody() ?? [];
            $attrs = $body['attributes'] ?? $body;
        }

        if (isset($attrs['diabetes_type'])) {
            $event->user->diabetes_type = trim((string) $attrs['diabetes_type']);
            $event->user->save();
        }
    }),
];
