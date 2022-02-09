"""
This module contains [`Behaviour`](@ref)s, as well as a specific type of
[`Behaviour`](@ref) -- [`NamedBehaviour`](@ref).
"""
module Behaviours

using UUIDs

export Behaviour
export NamedBehaviour
export uuid
export name

"""
A Behaviour which could be performed.

# Fields

- `uuid::`[`UUID`](@ref) -- The UUID of the [`Behaviour`](@ref).
"""
struct Behaviour
    uuid::UUID
end

"""
    uuid(b::Behaviour)::UUID

Gets the [`UUID`](@ref) of a [`Behaviour`](@ref).
"""
uuid(b::Behaviour)::UUID = b.uuid

"""
A Behaviour with a name.

# Fields

- `behaviour::`[`Behaviour`](@ref) -- The [`Behaviour`](@ref) to be named.
- `name::String` -- The name of the [`NamedBehaviour`](@ref).
"""
struct NamedBehaviour
    behaviour::Behaviour
    name::String
end

"""
    uuid(b::NamedBehaviour)::UUID

Gets the [`UUID`](@ref) of a [`NamedBehaviour`](@ref).
"""
uuid(b::NamedBehaviour)::UUID = b.behaviour.uuid

"""
    name(b::NamedBehaviour)::String

Gets the name of a [`NamedBehaviour`](@ref).
"""
name(b::NamedBehaviour)::String = b.name

greet() = print("Hello World!")

end # module
